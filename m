Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957406C3FEE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 02:42:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1penTp-00030R-C6; Tue, 21 Mar 2023 21:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1penTn-0002zl-7D
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 21:41:31 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1penTk-0000Z1-50
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 21:41:30 -0400
Received: by mail-qt1-x82f.google.com with SMTP id r16so21035167qtx.9
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 18:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista.com; s=google; t=1679449286; x=1682041286;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovpwW9RfSe84s8olMzVyWeUUzHYH5fTjgZhjPvkGhnA=;
 b=VbLBssUxJ0gczwWD1eSjW4EsEYFDjXw0K6cVEyOEKrxM5g1RsZteOtuHETC5FlB6rE
 j+NrF9WEgMwfdEyyns59GbEFmarczBxmC1GkYUJrfM31Bs0u7VCFxPAbAxaoSgjITGzF
 fqXjrZGfoeJOWDw5f8QN++5SbxBq8rRhen4Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679449286; x=1682041286;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovpwW9RfSe84s8olMzVyWeUUzHYH5fTjgZhjPvkGhnA=;
 b=vCDXMi/jApv7aeHRHxg1szSE/C0l66MA5B95PAm2W+77KMzb1B2lXab/v0Ij8k1txj
 k+NlwAXQEm1KP3/B5hxxjRfPS6MmcYsscx4mVTjySS9+QUhnGKi9aUU25AKm62mrIP63
 iaDfL3Hgs8OcjsKo8dEqo6f16681RISCiBBLEAnTcH+d18Y0/TD8jnloOSPs442gU1hz
 QGZR8sB9oZXyHBS6jn+T88dXEvtm0faZGgCRWVz4iL765BzIf2yxD1vrZIOsFL0sVe21
 lqHGzstNq7uIXkoI79Qb4ydrkJzNu0pzVqBVAFuXgc/JfV934BictKqmK6nXBY4D3OeX
 /GsQ==
X-Gm-Message-State: AO0yUKWmz0rO9487rY0fdE/SajX50ICWYf+TmZ0Mq0q1N/yp1A4C1j8U
 wdrdyKVPpZFVL38YmxVF/IVOMA==
X-Google-Smtp-Source: AK7set+MLdsfZD/bPr4lS2Pe2v5Js98RFyhnmzpUszwGqjByQiuXNwpd1hmjVRQOr/gSM+lzEjtaoA==
X-Received: by 2002:ac8:4e56:0:b0:3b8:6c6e:4949 with SMTP id
 e22-20020ac84e56000000b003b86c6e4949mr6575784qtw.4.1679449286361; 
 Tue, 21 Mar 2023 18:41:26 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:3f16:dd3d:6e57:2c5e])
 by smtp.gmail.com with ESMTPSA id
 de21-20020a05620a371500b007422fd3009esm10486893qkb.20.2023.03.21.18.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:41:25 -0700 (PDT)
Date: Tue, 21 Mar 2023 20:41:22 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RESEND] hw/i2c: Enable an id for the pca954x devices
Message-ID: <ZBpcwnsttm5NSbTc@minyard.net>
References: <20230321182744.2814034-1-venture@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=sha-256; boundary="KwVskSjUo/fTJcba"
Content-Disposition: inline
In-Reply-To: <20230321182744.2814034-1-venture@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=cminyard@mvista.com; helo=mail-qt1-x82f.google.com
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


--KwVskSjUo/fTJcba
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 11:27:44AM -0700, Patrick Venture wrote:
> This allows the devices to be more readily found and specified.
> Without setting the id field, they can only be found by device type
> name, which doesn't let you specify the second of the same device type
> behind a bus.

So basically, this helps you find a specific device if you have more
than one of them.  Yeah, probably a good idea in this case.

>=20
> Tested: Verified that by default the device was findable with the id
> 'pca954x[77]', for an instance attached at that address.
>=20
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index a9517b612a..4f8c2d6ae1 100644
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
> +    char *id;
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
> +    if (s->id) {
> +        d->id =3D g_strdup(s->id);
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
> +    DEFINE_PROP_STRING("id", Pca954xState, id),
> +    DEFINE_PROP_END_OF_LIST()
> +};

There is already an "id=3D" thing in qemu for doing links between front
ends and back ends.  That's probably not the best name to use.  Several
devices, like network devices, use "name" for identification in the
monitor.

-corey

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
> 2.35.1.894.gb6a874cedc-goog
>=20

--KwVskSjUo/fTJcba
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
MjIwMTQxMjJaMC8GCSqGSIb3DQEJBDEiBCDRZ/N4vPo5u63g/PyfMK7ORBdSbvVVT9+e8LN3
E2bLETB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUr
DgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQAnZvE2G0GTByDnaDmkN5a8
e96+5/HbOHQdPk6A4XsoUy5Tc1zr5h796NU4A2Ei3BK+4EIKFi+biiRwvetCFumgMuTSf2WS
7gbSV8DatDwxxkxwWK5LZz07sO1RyxhHeDUoH58OsBVqkPa26pMZCl29GSgvmJPLKEQPfcyU
mqhZYROXYmpFSVHFkn4E/TFOWEsNm78Pd3clQJpZmkozDHUF03zhQOmMmaf5sL9XtsU9EyVl
CE2iYPPP5X9+Ax5QueK5ThvREI7p4H0CGY4jaH6v+SYjI0bR2HOyYzAkWntYJSdJ51Xyacic
ueu1MeQySxwOjZHBagDhNv2UTd79ofq4

--KwVskSjUo/fTJcba--

