Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52853AE92
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 00:03:20 +0200 (CEST)
Received: from localhost ([::1]:48612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwWQw-0004mJ-Nu
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 18:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1nwWOm-0003nJ-5D
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 18:01:04 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1nwWOi-0000MT-BB
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 18:01:03 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d39f741ba0so4455313fac.13
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mvista.com; s=google;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :in-reply-to; bh=yKIR2XAGIXB+/F2roqZ+sRhpJ+MioX1BVYAo+elJc3w=;
 b=cILiV5iEykBK2ogLEN2LedghnQGmWdyKSbXHFXS2WlY7KyCh1gH7mb4OxCVNbPAJW0
 hnwQAx8NZ+nepi5jv0/fTFaWT0fyVpzPD5DQHlmjwJzP4fwL33wjuRihmsWg1PHFMKhr
 IEpIJFg0sNm4FxAmsO1r4nTKRwW+IcjcNtmts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:in-reply-to;
 bh=yKIR2XAGIXB+/F2roqZ+sRhpJ+MioX1BVYAo+elJc3w=;
 b=DNxKmUjslBCj1rWlWUhmFSjMWPdj/nAEmi/H2V0jFAF5bmaO4Q9djaSidKOxd81MaV
 A5Hvc0HlvC3mKN2iCPscZGVobMGP8/XmOlvV4vYEKSbPiqgTT9aMrTL1nV0vGHVzcdSs
 egPSEuBWwr8Npuesf37ajqeim6L5EhTLGqV7DfJWEBsOswv+T2EWOpG4oV8m/C+cgny+
 hzXc2jwxAnHSgCeS1EZobvgTwvM5BgmVjpoOgYdVYU4vZx6y1Z/LmBoCKMd18bp8pTw9
 MMqEBaoezjlFyaz7xLOhvQlf+BaV/hsqewz6P0+O5bmmspP4SXaUclQPeNF6OlP0jDL1
 VX8A==
X-Gm-Message-State: AOAM532tRti+lzZdG6/2O6cCp0iHjdHba2JPapKzVxF//U2gktRuOgdg
 PEa13xdXiXd6qtDUEqe2DGsjRA==
X-Google-Smtp-Source: ABdhPJwlu9o1BqqP6BYL5u7zsalUMMOsPL5NQjnMLvGr0ZUwoTxBOzcLgcKHgqgZTIlpsQj08KHKoA==
X-Received: by 2002:a05:6870:c34a:b0:ed:d705:7a34 with SMTP id
 e10-20020a056870c34a00b000edd7057a34mr1001000oak.93.1654120858283; 
 Wed, 01 Jun 2022 15:00:58 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:cca5:4cab:9a61:6930])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a056870a48200b000f37c1d5072sm1193306oal.38.2022.06.01.15.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 15:00:57 -0700 (PDT)
Date: Wed, 1 Jun 2022 17:00:55 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 qemu-arm@nongnu.org, Peter Delevoryas <pdel@fb.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [RFC PATCH v2 3/6] hw/i2c: support multiple masters
Message-ID: <20220601220055.GR2554462@minyard.net>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-4-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20220601210831.67259-4-its@irrelevant.dk>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000307ef405e06a06ef"
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=cminyard@mvista.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: cminyard@mvista.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000307ef405e06a06ef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 01, 2022 at 11:08:28PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Allow slaves to master the bus by registering a bottom halve. If the bus
> is busy, the bottom halve is queued up. When a slave has succesfully
                      ^ half
> mastered the bus, the bottom halve is scheduled.
                               ^ half

"halve" is a verb that means to split something into two pieces.  Yes,
English is a strange language :).

Also, technically from an I2C point of view, masters master the bus and
slaves only respond.  The way it's phrased here and elsewhere sounds a
little strange from that point of view.

I'm ok with this patch.  It's straightforward.

> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
>  include/hw/i2c/i2c.h | 14 ++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index d0cb2d32fa44..145dce60782a 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -13,6 +13,7 @@
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> +#include "qemu/main-loop.h"
>  #include "trace.h"
>  
>  #define I2C_BROADCAST 0x00
> @@ -62,6 +63,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
>  
>      bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
>      QLIST_INIT(&bus->current_devs);
> +    QSIMPLEQ_INIT(&bus->pending_masters);
>      vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
>      return bus;
>  }
> @@ -74,7 +76,7 @@ void i2c_slave_set_address(I2CSlave *dev, uint8_t address)
>  /* Return nonzero if bus is busy.  */
>  int i2c_bus_busy(I2CBus *bus)
>  {
> -    return !QLIST_EMPTY(&bus->current_devs);
> +    return !QLIST_EMPTY(&bus->current_devs) || bus->bh;
>  }
>  
>  bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
> @@ -180,6 +182,26 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>                                                 : I2C_START_SEND);
>  }
>  
> +void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
> +{
> +    if (i2c_bus_busy(bus)) {
> +        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
> +        node->bh = bh;
> +
> +        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
> +
> +        return;
> +    }
> +
> +    bus->bh = bh;
> +    qemu_bh_schedule(bus->bh);
> +}
> +
> +void i2c_bus_release(I2CBus *bus)
> +{
> +    bus->bh = NULL;
> +}
> +
>  int i2c_start_recv(I2CBus *bus, uint8_t address)
>  {
>      return i2c_do_start_transfer(bus, address, I2C_START_RECV);
> @@ -206,6 +228,16 @@ void i2c_end_transfer(I2CBus *bus)
>          g_free(node);
>      }
>      bus->broadcast = false;
> +
> +    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
> +        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
> +        bus->bh = node->bh;
> +
> +        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
> +        g_free(node);
> +
> +        qemu_bh_schedule(bus->bh);
> +    }
>  }
>  
>  int i2c_send(I2CBus *bus, uint8_t data)
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 5ca3b708c0be..be8bb8b78a60 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -69,13 +69,25 @@ struct I2CNode {
>      QLIST_ENTRY(I2CNode) next;
>  };
>  
> +typedef struct I2CPendingMaster I2CPendingMaster;
> +
> +struct I2CPendingMaster {
> +    QEMUBH *bh;
> +    QSIMPLEQ_ENTRY(I2CPendingMaster) entry;
> +};
> +
>  typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
> +typedef QSIMPLEQ_HEAD(I2CPendingMasters, I2CPendingMaster) I2CPendingMasters;
>  
>  struct I2CBus {
>      BusState qbus;
>      I2CNodeList current_devs;
> +    I2CPendingMasters pending_masters;
>      uint8_t saved_address;
>      bool broadcast;
> +
> +    /* Set from slave currently mastering the bus. */
> +    QEMUBH *bh;
>  };
>  
>  I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
> @@ -117,6 +129,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
>  
>  void i2c_end_transfer(I2CBus *bus);
>  void i2c_nack(I2CBus *bus);
> +void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
> +void i2c_bus_release(I2CBus *bus);
>  int i2c_send(I2CBus *bus, uint8_t data);
>  uint8_t i2c_recv(I2CBus *bus);
>  bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
> -- 
> 2.36.1
> 

--000000000000307ef405e06a06ef
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQ6AYJKoZIhvcNAQcCoIIQ2TCCENUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg4sMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkqhkiG9w0BAQsFADBlMQswCQYD
VQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29t
MSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgRzIwHhcNMTkwOTIzMTIyNTMyWhcN
MzQwOTIzMTIyNTMyWjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
VQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1cmVkIElEIENsaWVu
dCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOqxRa06rLwKBvrDb/qQ8RtX
feKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeG
vJoT0LS5t/zXeUcbMuDFWgyj33kiesnuusnOWvpISoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9
kKvHQvHC4x2u7wYv5+NXjnbOhJS/1NjGq+ugLMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrg
unsrYj9wgfW7XuhAi2j0y5d9oMT0SuVeKFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8RpLt05
WI2G2RNVVlHYaU0CAwEAAaOCAgQwggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5etI4814lRsqX75TjAf
BgNVHSMEGDAWgBTOw0q5mVXyuNtgv6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwTAYDVR0lBEUw
QwYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEEAYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMM
BgkqhkiG9y8BAQUwEgYDVR0TAQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUH
MAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3Js
My5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNVHSAEgcYwgcMw
gcAGBFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoG
CCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2Nl
cHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8v
d3d3LmRpZ2ljZXJ0LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQCo3MAIqR0kekG
YrC70EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJdgkASGsINabAfY2l
jUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fjCMf4NMWLUC8TqotnnrKN
uw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2VjoECzez2y/1IVTPlh57zBfjHJQFqLWzH
dou8M+ucdJtr2swXII6s3nkq4pfEn7KnbzMS9quFSuyOGILcg/3qVwaHNLM5R+8nB5gPI5+u5Uh5
6w1i+9Ds1pjYAiTHdeUwggOWMIICfqADAgECAhALkxw61jln6mcjv8OvmvRLMA0GCSqGSIb3DQEB
CwUAMGUxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5k
aWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0xMzA4
MDExMjAwMDBaFw0zODAxMTUxMjAwMDBaMGUxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2Vy
dCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3Vy
ZWQgSUQgUm9vdCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANnnKC9SPzZySYiT
NPP4ah4xVICfrVRBtUfflqjUr4AtuQrPdf2JpX0k+uMiDCu8lRcLM78ZTUEGkAC9DE0Q/ge15xxu
IlUxZZe90xfSHmLz2+psUIw/hAyWz7fLA+DKbaEUTBuJ3e0AsFJ8r5FssTgT0ekSCMAAsBwrEdp3
cDabrs55h9yCcOYJdHBVaa+jaJ+/3bZ5s/KdcClV9Kv/lWHzyUBvHdG+k7vTiCq7nb9yWlZxOz/U
89EK/ijvo+7Zma8D049gt/KSobG9iYkfMM3Dpi5iM64WAndEWueBCjynRC55uD8EvFygh+Ebr1GO
zews+vj+bfA6fKqL5GeVMY0CAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
AYYwHQYDVR0OBBYEFM7DSrmZVfK422C/qX69VrWXNqfWMA0GCSqGSIb3DQEBCwUAA4IBAQDKpVWM
48hBbmknp3UR7zyGNm/SncZ4OB1plqKSaS44bJt9BNSJpbExN4rJIcyrbM2LHJrWv0jSMmbBisDz
LzrvwOPUkYbRUOMD23N3b0o5U+3eJse1fa8rQtF1YuNKKwLHUEvgaeKWbA5EZhBEj60F6/h5rKYb
6Dc0nVPJYaqiUq9KcBaGwjrIsRNwNtjP7vQKNNVbTP0HnKK62QFyXPNNwd0OsRwNxGO+rfQU+4ns
okEOTMzIV0DQbgOqzQyOiZmZbPA8MK8432+8o74pICerdP8TInjel1JVHoO1VCAD7q7AT1beN8zD
f6oEJ7vTd7hi2xd8nCgiE3Nszyb1iinnMIIFKzCCBBOgAwIBAgIQCPdWMA138ZCH0Zxtj7kynDAN
BgkqhkiG9w0BAQsFADBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
VQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1cmVkIElEIENsaWVu
dCBDQSBHMjAeFw0yMjA1MDUwMDAwMDBaFw0yNDA1MDUyMzU5NTlaMEIxHDAaBgNVBAMME2NtaW55
YXJkQG12aXN0YS5jb20xIjAgBgkqhkiG9w0BCQEWE2NtaW55YXJkQG12aXN0YS5jb20wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDY2HEGeR0DklI0Rsc7cH8OHr9h6y5Fg/qtl6HVGuHC
b4jSzyo2ys2peHLhx979LWXp53YYOGrZZ394baGNPmoYpbXJ/W5k/aWXK7vfImw+gwbgeuHhc2Dp
HJhoe9DURVt9gDO82SMjR/IKqSVwg45JHBxF70EqrhSBeMkgGTKxvfcU2tpDxtBVL0vxg81/Flai
e6yI9hArJLMOCmCnYRiI+tgT6BFslDBXsCWEKvjEfMJMnNVStTUiXmSBQy0HiDkSE3ldzhgn7GfY
BWXXJySlPK4HhTovbV1T1VDACwUutqZCGUNBNilu41So+zk2eVRBhkHvdFk8qhDv3kQNZgz9AgMB
AAGjggHzMIIB7zAfBgNVHSMEGDAWgBSlYiBQ3LtbV5etI4814lRsqX75TjAdBgNVHQ4EFgQU1rCH
cfCGeI7qWJROdKkH8y8zjRowDAYDVR0TAQH/BAIwADAeBgNVHREEFzAVgRNjbWlueWFyZEBtdmlz
dGEuY29tMA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwQwYD
VR0gBDwwOjA4BgpghkgBhv1sBAEBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0
LmNvbS9DUFMwgYsGA1UdHwSBgzCBgDA+oDygOoY4aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0Rp
Z2lDZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcmwwPqA8oDqGOGh0dHA6Ly9jcmw0LmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENsaWVudENBRzIuY3JsMH0GCCsGAQUFBwEBBHEwbzAkBggr
BgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEcGCCsGAQUFBzAChjtodHRwOi8vY2Fj
ZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURDbGllbnRDQUcyLmNydDANBgkqhkiG
9w0BAQsFAAOCAQEAUpuWwUYMpUU+gPKxMzEPOkQBp9BR9ZBF9/Kr5WU5Vakt4hPs1nmQ3/Wr+HmB
4llcJj8DM/dI3vY2Wlsr0ydBWi2ZDN2Q+NbapQteT9SzEn/Ops72bzOzkD/cMypxtWvJ+iUgVYeM
G6Ogl9m3UMnKgDGj+lN++EZt6mmHBNwqVm50lPQxYYl8MAqlVZRz95XYpe4dKPintnruV9Snmpnf
KyDibF5/GZ3yMId625GUdOCA5W6USe9ytcrYpSotNxeKx5a2vSB5PDkH3bJSILrOQ45uBglwWvDM
Xjuenh8YM44JfoWRVC02niCs7rCl0drMK5X/dIU7b3KY1VQtg+sMqDGCAoAwggJ8AgEBMH4wajEL
MAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0
LmNvbTEpMCcGA1UEAxMgRGlnaUNlcnQgQXNzdXJlZCBJRCBDbGllbnQgQ0EgRzICEAj3VjANd/GQ
h9GcbY+5MpwwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEINy0hbBUfN/Z7FUcdQVs
DFh1PO7YZlSTZPvDCuzplIovMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIyMDYwMTIyMDA1OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsG
CWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBxPlIZob804VisNxMTyETrGbY5zFJTocJHAlOw
wZSWHd1QTuv/SJVFp+444dkijYcg5gYu2dKE3K8wCylRfb56cxPJP1SZOxoghG+vasxYHXuROxiR
S3DzRxchiCYNuypoRCiD98aTRhmRmUawBKUzSmuZwhPKde9ZlSEc0vVo062qaKNoagJhVxKYls4P
/oiDRG4ZmnW6nX/AzrUaUhlXk9ka7PMKsjNqZzIzUg8xTB60l/fd3EJ5V2kwv3WRtFe4BvUfHgCy
5W4LNN6oN1T8MYkevgSLyaZ7Wf6VIfei4REV3k7GEgkUXWE7iGvzzYr0hp7rl9+jj6ig+PUVo2Ey
--000000000000307ef405e06a06ef--

