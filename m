Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1DC24FCF1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 13:47:59 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAAxC-0000cs-Fs
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 07:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kAAsG-0007kw-PS
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:42:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kAAsE-0002pp-Vp
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:42:52 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id C636640450;
 Mon, 24 Aug 2020 14:42:39 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 094A993;
 Mon, 24 Aug 2020 14:42:41 +0300 (MSK)
Subject: Re: [PATCH] ati-vga: Fix checks in ati_2d_blt() to avoid crash
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20200406204029.19559747D5D@zero.eik.bme.hu>
 <2041026f-7a88-d8f7-8738-968e1394e8c6@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <2def3847-58c7-af76-528b-c96d968eb410@msgid.tls.msk.ru>
Date: Mon, 24 Aug 2020 14:42:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2041026f-7a88-d8f7-8738-968e1394e8c6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 07:42:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -90
X-Spam_score: -9.1
X-Spam_bar: ---------
X-Spam_report: (-9.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Prasad J Pandit <pjp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.08.2020 15:31, Philippe Mathieu-Daudé пишет:
> On 4/6/20 10:34 PM, BALATON Zoltan wrote:
>> In some corner cases (that never happen during normal operation but a
>> malicious guest could program wrong values) pixman functions were
>> called with parameters that result in a crash. Fix this and add more
>> checks to disallow such cases.
> 
> (Fair) question on IRC. Is this patch fixing CVE-2020-24352?

Actually this is CVE-2020-11869. Almost of the same level as
CVE-2020-24352, I think, especialy having in mind the experimental
state of ati-vga.

CVE-2020-24352 is still muddy.

/mjt

