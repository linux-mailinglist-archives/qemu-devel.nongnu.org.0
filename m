Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD5F2FD502
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:11:42 +0100 (CET)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2G55-0001Ge-A0
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1l2Fwf-0004LE-7G
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:02:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1l2Fwd-0005dt-4v
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:02:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1F73D40655;
 Wed, 20 Jan 2021 19:02:52 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2CC555B;
 Wed, 20 Jan 2021 19:02:52 +0300 (MSK)
Subject: Re: qemu broke booting of old RedHat floppies
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
References: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@tls.msk.ru>
 <098ce1c2-e304-bf37-c3f9-f8cd81028020@tls.msk.ru>
Message-ID: <3a25a973-af9c-0d87-ae30-f0758742c3c6@msgid.tls.msk.ru>
Date: Wed, 20 Jan 2021 19:02:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <098ce1c2-e304-bf37-c3f9-f8cd81028020@tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And one more followup to my own email.
As I didn't remember what's the std size of 144M floppy image
I weren't able to check, but the file size looked suspectably
for me at the very beginning. And indeed, std 144M floppy is
smaller than that. After truncating the file to 1440*1024 bytes
it works fine. The extra content seem not to belong to the image
itself and were added by something on the way to the archive
page.  So this issue ended up as being a non-issue.

One thing still bothers me:

>   $ qemu-system-x86_64 \
>    -drive file=RedHatLinuxBootDisk521998.disk1of1.img,if=none,id=d,format=raw \
>    -device floppy,drive=d,type=144
> 
> But it fails:
> 
>   qemu-system-x86_64: -device floppy,drive=d,type=144: Insufficient permission to perform this operation

This same error message is returned after truncating the image
to 1440*1024 bytes. By current qemu 5.2. Why?

Thanks,

/mjt

