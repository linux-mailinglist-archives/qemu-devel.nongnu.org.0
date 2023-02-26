Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768FA6A348A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:16:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPJy-0007S4-Bq; Sun, 26 Feb 2023 17:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPJm-0007CY-DB; Sun, 26 Feb 2023 17:16:30 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPJk-0005Q3-Ql; Sun, 26 Feb 2023 17:16:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 41E1A746E5A;
 Sun, 26 Feb 2023 23:16:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0BAE1746E06; Sun, 26 Feb 2023 23:16:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 097B9746E58;
 Sun, 26 Feb 2023 23:16:24 +0100 (CET)
Date: Sun, 26 Feb 2023 23:16:24 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Sebastian Bauer <mail@sebastianbauer.info>
Subject: Re: [PATCH] hw/display/sm501: Implement more 2D raster operations
In-Reply-To: <05a0390e-b14f-6a2e-678e-c2b680e6d8cf@linaro.org>
Message-ID: <edfbe410-dbbb-0c41-b4ca-f2f244eeb693@eik.bme.hu>
References: <20230216144043.D632874634B@zero.eik.bme.hu>
 <05a0390e-b14f-6a2e-678e-c2b680e6d8cf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2146607838-1677449784=:59185"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2146607838-1677449784=:59185
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 26 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 16/2/23 15:40, BALATON Zoltan wrote:
>> Add simple implementation for two raster operations that are used by
>> AmigaOS which fixes graphics problems in some progtams using these.
>
> Typo "programs".

Fixed in v3 (was just in time for that :-) ).

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> For definitions of these see:
>> https://learn.microsoft.com/en-us/windows/win32/gdi/ternary-raster-operations
>
> Comment worth being in the commit description IMO.

I don't think adding URLs to the source that can remain the same for years 
while URLs can go away is a good idea. It's only here to help review.

Regards,
BALATON Zoltan

>>   hw/display/sm501.c | 30 +++++++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>
>
>
--3866299591-2146607838-1677449784=:59185--

