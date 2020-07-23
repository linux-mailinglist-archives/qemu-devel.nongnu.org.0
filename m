Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111822AFCA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 15:00:11 +0200 (CEST)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyapW-0004Mj-0T
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 09:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jyajw-0008MS-6K
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 08:54:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jyaju-0007de-4C
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 08:54:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A73D94071A;
 Thu, 23 Jul 2020 15:54:18 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 5DA969C;
 Thu, 23 Jul 2020 15:54:19 +0300 (MSK)
Subject: Re: [PATCH] acpi: Fix access to PM1 control and status registers
To: Anthony PERARD <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200701110549.148522-1-anthony.perard@citrix.com>
 <20200701075914-mutt-send-email-mst@kernel.org>
 <20200701124836.GD2030@perard.uk.xensource.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <3eb33054-e9b0-58f2-8d50-9cc26314dcfb@msgid.tls.msk.ru>
Date: Thu, 23 Jul 2020 15:54:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701124836.GD2030@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 08:54:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.07.2020 15:48, Anthony PERARD wrote:

> I actually tried, but when reading `addr` or `addr+1` I had the same
> value. So I guess `addr` wasn't taken into account.

AFAICS, these registers aren't actually supposed to be accessed like this
as addr+1. ACPI and ISA spec states multiple times that `addr' should be
accessible as 8/16/32 bits, but it does not mention `addr+1' or `addr+2'.

So far all now-rejected accesses we've seen (not that many but still) goes
to `addr', not to any other variation of it.

/mjt

