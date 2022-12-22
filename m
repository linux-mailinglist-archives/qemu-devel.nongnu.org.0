Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6066545A1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 18:34:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8PRd-000461-7s; Thu, 22 Dec 2022 12:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1p8PRB-00042y-5Q
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 12:33:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1p8PR9-0006Ud-5T
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 12:32:56 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4skB-1p88Jz3RmJ-001zqk; Thu, 22 Dec 2022 18:32:48 +0100
Message-ID: <0bb3a2a6-52b5-03cd-c036-f19d945a8cf2@vivier.eu>
Date: Thu, 22 Dec 2022 18:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] nubus-device: fix memory leak in nubus_device_realize
Content-Language: fr
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
References: <20221222172915.671597-1-mcascell@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221222172915.671597-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+61sFj2H/GJ8oExT+ROtzf89+ov6tLDIm50cLXUmtXwaBd36r5y
 e1AX74Tg/H/oRQMIQncINyZCHZJimWEvjfWmGTdTinIcfN1T2N4f9Ob+cTPzYAfUkbBqJSZ
 mGejw/tERODGkc5q1JjMhez6oA6p3uyOhWrv87NPhSoOl3NdRdqFllVrT1yH2kFt4ZpcviU
 MyGruQB9QzMZAvL820dCQ==
UI-OutboundReport: notjunk:1;M01:P0:EWJKCfzpPVs=;VxsFciYA2oKTMxgHcWFNoaxOlRC
 CG1079V7ptECyYEXOpBP5OBwk6PaLX55yDHLnJAO6dWgYVhl4qc/kZSqmh+MGNyHAJQII5A1Z
 ZpXlq5KsguyTm/qQpQXmHpv6kmLKWquN5hhTsyzPscf7Rcm9qBOoZ0yv7YPIzJpPokIwGa05n
 lo3JylyPb3JIbSSOgQSqPSZtSscQ+GaciF1SoXqncm+nQF2H5LR+Wi3CV5hGMieAwE/NHCGG2
 uVff3ETRfH4rSaWzvFHu5OusXdrW3RSGfbgAxK532c86Gi9jdayDkEAMGk2+1kIJLU09pA1iY
 T9E7pPggwbNs+QIx/YzwvoDgynMDV3BjyNQLYIq0XyR/r6JUcliTTq1UMIcpvPN9la77yt9YV
 /MtiUxGHGRYSXRPJcdnSY4CmDQZLlU7SuvbeRp7XVMMu9qxN1XRnrhddq/WDqISXYoZqm+BE8
 vVsD0slFB9/c56N98hav1NcXh6jRU8g4PHntUEL42Wd65X/UpV+dXmv6JVCVeGdlnb1EkHkKO
 02JrX8KxERMandUcaZyefVHFcSIdassP2wy1V1KW0+k2AD1VBs3B/SlE2Egs5SuIxapFtaFrF
 SvJA9nXQb/n7dYNhhblyjjVyOR/KJru4o2kjK8MzX5rwoiN7IDfSZwD81DGwTkua9j8hddq4B
 sWcEVZW+6DSMYijafJm3egYTEUxNgZtHRaI/ut2meQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/12/2022 à 18:29, Mauro Matteo Cascella a écrit :
> Local variable "name" is allocated through strdup_printf and should be
> freed with g_free() to avoid memory leak.
> 
> Fixes: 3616f424 ("nubus-device: add romfile property for loading declaration ROMs")
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   hw/nubus/nubus-device.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 0f1852f671..49008e4938 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -80,6 +80,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>                                  &error_abort);
>           ret = load_image_mr(path, &nd->decl_rom);
>           g_free(path);
> +        g_free(name);
>           if (ret < 0) {
>               error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
>               return;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

