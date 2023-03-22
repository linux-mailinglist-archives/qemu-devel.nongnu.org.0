Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928736C5A57
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:30:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6mQ-0006Lb-IP; Wed, 22 Mar 2023 18:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1pf6mK-0006LP-M3
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:17:56 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1pf6m5-00068o-RR
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:17:53 -0400
Received: by mail-qv1-xf36.google.com with SMTP id l7so2465015qvh.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista.com; s=google; t=1679523431; x=1682115431;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNgDi8+wF0YlZKvWKii9teKxQGa60IbB0WrlRsxEVjg=;
 b=QoHqR+mNb21I5ga/Xx9iS/v50pYL7VxrrOxPxVf76f56yIGuWsy8aOAkEDBJlqnwb7
 /qxpbrEnKvLdCmX8FQxJWzx7eO0lsWSUYPg9Yb1H4O6CDpDS72Onw93FOYhw3ZNqXJrk
 WJn5zKV1LH8X3O70JOHCAkxY0IjhG45Ue+ED8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523431; x=1682115431;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNgDi8+wF0YlZKvWKii9teKxQGa60IbB0WrlRsxEVjg=;
 b=7agLYbsM9WY40Y4PvPaRt9l1HpsAaDX7P8yK4Rvdmge+pPf7qRIvGZ8U3D2cRn8SQ2
 NMZ0saR3flnm3Ngsij+PZaEFGac+UhoqIarbXDZ7B9KFghvHunPCx0YBaDtSbkeXKSx5
 eR9EVZbLNDVG8atIJruK3Yym1ENL5npf6I3eEQRYtZr/leUDbEqbSH2st4SREIH9/76k
 ofaVUR/lwBUbWpr53Z7uM0XjW6CRZkfvQag7+KQIczc4ZvRcOcRys796HhqXtIddNMsG
 ZU/2/Zd4EaaCvLh863LqZn5DOVz2tLjC8z9BsbWA052OD9H4QZHo5yeYSY39LGP3rUNB
 QrpQ==
X-Gm-Message-State: AO0yUKXLpnIIpNY80rzn2l1hBKSmp5ZqWeRg2C91Rq5zA9F85h1pEnTQ
 1hmXGeMidJ8mk8ztk2yAoKuD211wMZ0BsWiclPPWvA==
X-Google-Smtp-Source: AK7set9fAqrA9MyahleWrhJqvX4N9kLCoVy94YCJM1phVx0oo0Ufg5FQRmXvjO+2McbZK+aSsiMgcw==
X-Received: by 2002:a05:622a:1a17:b0:3bf:a60d:43b9 with SMTP id
 f23-20020a05622a1a1700b003bfa60d43b9mr13555758qtb.4.1679519946401; 
 Wed, 22 Mar 2023 14:19:06 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:3214:777f:4ba9:15f6])
 by smtp.gmail.com with ESMTPSA id
 o16-20020ac86990000000b003bf9f9f1844sm10738717qtq.71.2023.03.22.14.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 14:19:05 -0700 (PDT)
Date: Wed, 22 Mar 2023 16:19:03 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RESEND v2] hw/i2c: Enable an id for the pca954x devices
Message-ID: <ZBtwxzc7xpazByqK@minyard.net>
References: <20230322172136.48010-1-venture@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=sha-256; boundary="lOaaaqfcI0ci4hLW"
Content-Disposition: inline
In-Reply-To: <20230322172136.48010-1-venture@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=cminyard@mvista.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--lOaaaqfcI0ci4hLW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 10:21:36AM -0700, Patrick Venture wrote:
> This allows the devices to be more readily found and specified.
> Without setting the name field, they can only be found by device type
> name, which doesn't let you specify the second of the same device type
> behind a bus.
>=20
> Tested: Verified that by default the device was findable with the name
> 'pca954x[77]', for an instance attached at that address.

This looks good to me.

Acked-by: Corey Minyard <cminyard@mvista.com>

if you are taking this in through another tree.  Or do you want me to
take this?

-corey

>=20
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> v2: s/id/name/g to use name as the identifier field. left 'id' in subject=
 for email chain.
> ---
>  hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index 3945de795c..76e69bebc5 100644
> --- a/hw/i2c/i2c_mux_pca954x.c
> +++ b/hw/i2c/i2c_mux_pca954x.c
> @@ -20,6 +20,7 @@
>  #include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_slave.h"
>  #include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> @@ -43,6 +44,8 @@ typedef struct Pca954xState {
> =20
>      bool enabled[PCA9548_CHANNEL_COUNT];
>      I2CBus *bus[PCA9548_CHANNEL_COUNT];
> +
> +    char *name;
>  } Pca954xState;
> =20
>  /*
> @@ -181,6 +184,17 @@ static void pca9548_class_init(ObjectClass *klass, v=
oid *data)
>      s->nchans =3D PCA9548_CHANNEL_COUNT;
>  }
> =20
> +static void pca954x_realize(DeviceState *dev, Error **errp)
> +{
> +    Pca954xState *s =3D PCA954X(dev);
> +    DeviceState *d =3D DEVICE(s);
> +    if (s->name) {
> +        d->id =3D g_strdup(s->name);
> +    } else {
> +        d->id =3D g_strdup_printf("pca954x[%x]", s->parent.i2c.address);
> +    }
> +}
> +
>  static void pca954x_init(Object *obj)
>  {
>      Pca954xState *s =3D PCA954X(obj);
> @@ -197,6 +211,11 @@ static void pca954x_init(Object *obj)
>      }
>  }
> =20
> +static Property pca954x_props[] =3D {
> +    DEFINE_PROP_STRING("nane", Pca954xState, name),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void pca954x_class_init(ObjectClass *klass, void *data)
>  {
>      I2CSlaveClass *sc =3D I2C_SLAVE_CLASS(klass);
> @@ -209,9 +228,12 @@ static void pca954x_class_init(ObjectClass *klass, v=
oid *data)
>      rc->phases.enter =3D pca954x_enter_reset;
> =20
>      dc->desc =3D "Pca954x i2c-mux";
> +    dc->realize =3D pca954x_realize;
> =20
>      k->write_data =3D pca954x_write_data;
>      k->receive_byte =3D pca954x_read_byte;
> +
> +    device_class_set_props(dc, pca954x_props);
>  }
> =20
>  static const TypeInfo pca954x_info[] =3D {
> --=20
> 2.40.0.rc1.284.g88254d51c5-goog
>=20

--lOaaaqfcI0ci4hLW
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIINXgYJKoZIhvcNAQcCoIINTzCCDUsCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgggqSMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkqhkiG9w0BAQsFADBl
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGln
aWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgRzIwHhcNMTkw
OTIzMTIyNTMyWhcNMzQwOTIzMTIyNTMyWjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGln
aUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2Vy
dCBBc3N1cmVkIElEIENsaWVudCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAOqxRa06rLwKBvrDb/qQ8RtXfeKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln
4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeGvJoT0LS5t/zXeUcbMuDFWgyj33kiesnuusnOWvpI
SoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9kKvHQvHC4x2u7wYv5+NXjnbOhJS/1NjGq+ug
LMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrgunsrYj9wgfW7XuhAi2j0y5d9oMT0SuVe
KFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8RpLt05WI2G2RNVVlHYaU0CAwEAAaOCAgQw
ggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5etI4814lRsqX75TjAfBgNVHSMEGDAWgBTOw0q5mVXy
uNtgv6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwTAYDVR0lBEUwQwYIKwYBBQUHAwIGCCsG
AQUFBwMEBgorBgEEAYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUw
EgYDVR0TAQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3JsMy5kaWdp
Y2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNVHSAEgcYwgcMwgcAG
BFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoG
CCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBh
Y2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0
dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQC
o3MAIqR0kekGYrC70EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJ
dgkASGsINabAfY2ljUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fj
CMf4NMWLUC8TqotnnrKNuw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2VjoECzez2
y/1IVTPlh57zBfjHJQFqLWzHdou8M+ucdJtr2swXII6s3nkq4pfEn7KnbzMS9quFSuyOGILc
g/3qVwaHNLM5R+8nB5gPI5+u5Uh56w1i+9Ds1pjYAiTHdeUwggUrMIIEE6ADAgECAhAI91Yw
DXfxkIfRnG2PuTKcMA0GCSqGSIb3DQEBCwUAMGoxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxE
aWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKTAnBgNVBAMTIERpZ2lD
ZXJ0IEFzc3VyZWQgSUQgQ2xpZW50IENBIEcyMB4XDTIyMDUwNTAwMDAwMFoXDTI0MDUwNTIz
NTk1OVowQjEcMBoGA1UEAwwTY21pbnlhcmRAbXZpc3RhLmNvbTEiMCAGCSqGSIb3DQEJARYT
Y21pbnlhcmRAbXZpc3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANjY
cQZ5HQOSUjRGxztwfw4ev2HrLkWD+q2XodUa4cJviNLPKjbKzal4cuHH3v0tZenndhg4atln
f3htoY0+ahiltcn9bmT9pZcru98ibD6DBuB64eFzYOkcmGh70NRFW32AM7zZIyNH8gqpJXCD
jkkcHEXvQSquFIF4ySAZMrG99xTa2kPG0FUvS/GDzX8WVqJ7rIj2ECsksw4KYKdhGIj62BPo
EWyUMFewJYQq+MR8wkyc1VK1NSJeZIFDLQeIORITeV3OGCfsZ9gFZdcnJKU8rgeFOi9tXVPV
UMALBS62pkIZQ0E2KW7jVKj7OTZ5VEGGQe90WTyqEO/eRA1mDP0CAwEAAaOCAfMwggHvMB8G
A1UdIwQYMBaAFKViIFDcu1tXl60jjzXiVGypfvlOMB0GA1UdDgQWBBTWsIdx8IZ4jupYlE50
qQfzLzONGjAMBgNVHRMBAf8EAjAAMB4GA1UdEQQXMBWBE2NtaW55YXJkQG12aXN0YS5jb20w
DgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjBDBgNVHSAE
PDA6MDgGCmCGSAGG/WwEAQEwKjAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cuZGlnaWNlcnQu
Y29tL0NQUzCBiwYDVR0fBIGDMIGAMD6gPKA6hjhodHRwOi8vY3JsMy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkSURDbGllbnRDQUcyLmNybDA+oDygOoY4aHR0cDovL2NybDQuZGln
aWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcmwwfQYIKwYBBQUHAQEE
cTBvMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wRwYIKwYBBQUHMAKG
O2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENsaWVudENB
RzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBSm5bBRgylRT6A8rEzMQ86RAGn0FH1kEX38qvl
ZTlVqS3iE+zWeZDf9av4eYHiWVwmPwMz90je9jZaWyvTJ0FaLZkM3ZD41tqlC15P1LMSf86m
zvZvM7OQP9wzKnG1a8n6JSBVh4wbo6CX2bdQycqAMaP6U374Rm3qaYcE3CpWbnSU9DFhiXww
CqVVlHP3ldil7h0o+Ke2eu5X1Keamd8rIOJsXn8ZnfIwh3rbkZR04IDlbpRJ73K1ytilKi03
F4rHlra9IHk8OQfdslIgus5Djm4GCXBa8MxeO56eHxgzjgl+hZFULTaeIKzusKXR2swrlf90
hTtvcpjVVC2D6wyoMYICkDCCAowCAQEwfjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGln
aUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2Vy
dCBBc3N1cmVkIElEIENsaWVudCBDQSBHMgIQCPdWMA138ZCH0Zxtj7kynDANBglghkgBZQME
AgEFAKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMzAz
MjIyMTE5MDNaMC8GCSqGSIb3DQEJBDEiBCBicfdShDrbCNAS9gFp+Rr8GYRyxlE10RzBaRcD
wQBupjB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUr
DgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQBgpIk4uYz8aRvulxtMN3S1
gcknRGmQZA6JtCn3+nNUYlNPmUgOXOnOkcmXMQE/XCjoeSCATOukqTIN0E02BEgR+X+L/+F1
MADQoLKR0KIY3prMZaRFfT6kzel5ekZzfxq7Pqqn9petG/BTB/HrBNNKW72uxFrF541D47Hk
wQm+usaX39OdYJgTrbIHUo4IKUi+dbLPDKNs8yaktbfn6Zfx27pRkwDp5HXfCSI2wjpW8EoF
7m/lY+fcj+hBWiWVAoBPmZYK94MGOHEhYgPJHoSj0ZH8LrHRNwwYdd1u6j5gk/ZzNG/OcIP6
5w4u8zwCM1uflVnHBAlp8MAfc5qC5drp

--lOaaaqfcI0ci4hLW--

