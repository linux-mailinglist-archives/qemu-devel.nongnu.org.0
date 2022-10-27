Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C760F5A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:45:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0LW-0002yv-0w; Thu, 27 Oct 2022 06:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1oo0LM-0002nl-Mw
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:42:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1oo0LK-00024u-Qk
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:42:36 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0DF9640E03;
 Thu, 27 Oct 2022 13:42:29 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 5652F13A;
 Thu, 27 Oct 2022 13:42:32 +0300 (MSK)
Message-ID: <ff22a2ac-d058-2448-0e76-03223f7f46dc@msgid.tls.msk.ru>
Date: Thu, 27 Oct 2022 13:42:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 0/2] linux-user: handle /proc/self/exe with execve()
 syscall
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220927124357.688536-1-laurent@vivier.eu>
 <0d4e74bf-c5fd-7572-3e7e-d9165fc89472@msgid.tls.msk.ru>
 <faeecc92-6fa2-6a5e-dc31-353989d168bc@vivier.eu>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <faeecc92-6fa2-6a5e-dc31-353989d168bc@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

27.10.2022 09:40, Laurent Vivier wrote:
..
> I tried O_CLOEXEC, but it seems the fd is closed before it is needed by execveat() to re-spawn the process, so it exits with an error (something like 
> EBADF)

It works here for me with a simple test program:

#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/syscall.h>
#define AT_EMPTY_PATH		0x1000

static char *argv[] = { "ls", NULL };
static char *envp[] = { NULL };

int main(void) {
   int fd = open("/usr/bin/ls", O_RDONLY);
   fcntl(fd, F_SETFD, O_CLOEXEC);
   //execveat(fd, "", argv, envp, AT_EMPTY_PATH);
   syscall(__NR_execveat, fd, "", argv, envp, AT_EMPTY_PATH);
   return 0;
}


/mjt

