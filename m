Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352853AEAE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 00:08:28 +0200 (CEST)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwWVu-0007JG-ND
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 18:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1nwWT2-0005gS-7k
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 18:05:28 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1nwWSz-00014m-9s
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 18:05:27 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-d39f741ba0so4468308fac.13
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mvista.com; s=google;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :in-reply-to; bh=+fvBUYcTn4dzz/bi4m6SrwxdETkJDgdpHtE7jmVqPps=;
 b=S1JxrbbXFDWlqK9x79UzX0eU/rgxeZKcDa/cB6fxKd97M4+F5dbFKR+2QpVVFzD9dx
 c7KEwO4/acAdnhCUyxqnEEkWUTsw+gNs1/2zHAZFCXyvtP/FACQUUyhWnuW8Zem0R4fy
 hPdZYfHpcPm6nui3DzT5wpgZFvzIIcX1pXGyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:in-reply-to;
 bh=+fvBUYcTn4dzz/bi4m6SrwxdETkJDgdpHtE7jmVqPps=;
 b=Qui4K/2shk4SZfJqYAt230nshfrFpnh/lolgijtptMhEIdqpsm0fVTaFFy9hhoVgCP
 RMsdzm24hJTX/nIvXJwu89r/0JgnNN0/ybD+XQzBCt4CCWcbxcAJ4LYHN+t7QYh0M4NA
 hIy3PdbpOGD+DPGOv2hyW7kdeyP0u7TubD7F5SCtdRlaudizDN/P22ndO6rW7lSiYicO
 EhiaOEHL3LhAI3laLWcEhFY9k0B2DSmSOblYr/MtJkDZoKcQfwWkyRvO2UqKyRLsni/N
 FSqkBvzJmNSiZ5cOW8kCCS0uyu8W7WCZP4yv7qWcd0F1lovtl8Mva6pQmLVclX6iwuXX
 xAJQ==
X-Gm-Message-State: AOAM532Hbeidn3jtJWH/IEcilOhBL2g2hFuxYfwlSCOB5xSE6JfYPyqy
 zEC3Opd12Q3y4VaVxSY/xbThbg==
X-Google-Smtp-Source: ABdhPJwKDuEpsXGiFW0T8mXnEXaRfXWOsDL3hKt28LDFni8NXxT3keF/XcVe2no7QTbiHOFt6m1mRA==
X-Received: by 2002:a05:6870:1781:b0:f3:101e:7685 with SMTP id
 r1-20020a056870178100b000f3101e7685mr1029483oae.125.1654121123740; 
 Wed, 01 Jun 2022 15:05:23 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:cca5:4cab:9a61:6930])
 by smtp.gmail.com with ESMTPSA id
 ej24-20020a056870f71800b000f30837129esm1241724oab.55.2022.06.01.15.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 15:05:23 -0700 (PDT)
Date: Wed, 1 Jun 2022 17:05:21 -0500
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
Subject: Re: [RFC PATCH v2 4/6] hw/i2c: add asynchronous send
Message-ID: <20220601220521.GS2554462@minyard.net>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-5-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20220601210831.67259-5-its@irrelevant.dk>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000038ae805e06a1612"
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=cminyard@mvista.com; helo=mail-oa1-x29.google.com
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

--000000000000038ae805e06a1612
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 01, 2022 at 11:08:29PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add an asynchronous version of i2c_send() that requires the slave to
> explicitly acknowledge on the bus with i2c_ack().
> 
> The current master must use the new i2c_start_send_async() to indicate
> that it wants to do an asynchronous transfer. This allows the i2c core
> to check if the target slave supports this or not. This approach relies
> on adding a new enum i2c_event member, which is why a bunch of other
> devices needs changes in their event handling switches.

This would be easier to read if you split out the default return of -1
in all the devices to a separate patch.

You've already pointed out the lack of nack support.

I think this is ok outside of that.

-corey

> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/arm/pxa2xx.c            |  2 ++
>  hw/display/sii9022.c       |  2 ++
>  hw/display/ssd0303.c       |  2 ++
>  hw/i2c/core.c              | 36 +++++++++++++++++++++++++++++++++++-
>  hw/i2c/smbus_slave.c       |  4 ++++
>  hw/i2c/trace-events        |  2 ++
>  hw/misc/ibm-cffps.c        |  2 ++
>  hw/misc/ir35221.c          |  2 ++
>  hw/nvram/eeprom_at24c.c    |  2 ++
>  hw/sensor/lsm303dlhc_mag.c |  2 ++
>  include/hw/i2c/i2c.h       | 16 ++++++++++++++++
>  11 files changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index f4f687df68ef..93dda83d7aa9 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -1305,6 +1305,8 @@ static int pxa2xx_i2c_event(I2CSlave *i2c, enum i2c_event event)
>      case I2C_NACK:
>          s->status |= 1 << 1;				/* set ACKNAK */
>          break;
> +    default:
> +        return -1;
>      }
>      pxa2xx_i2c_update(s);
>  
> diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
> index b591a5878901..664fd4046d82 100644
> --- a/hw/display/sii9022.c
> +++ b/hw/display/sii9022.c
> @@ -76,6 +76,8 @@ static int sii9022_event(I2CSlave *i2c, enum i2c_event event)
>          break;
>      case I2C_NACK:
>          break;
> +    default:
> +        return -1;
>      }
>  
>      return 0;
> diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
> index aeae22da9c29..d67b0ad7b529 100644
> --- a/hw/display/ssd0303.c
> +++ b/hw/display/ssd0303.c
> @@ -196,6 +196,8 @@ static int ssd0303_event(I2CSlave *i2c, enum i2c_event event)
>      case I2C_NACK:
>          /* Nothing to do.  */
>          break;
> +    default:
> +        return -1;
>      }
>  
>      return 0;
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 145dce60782a..d4ba8146bffb 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
>             start condition.  */
>  
>          if (sc->event) {
> -            trace_i2c_event("start", s->address);
> +            trace_i2c_event(event == I2C_START_SEND ? "start" : "start_async",
> +                            s->address);
>              rv = sc->event(s, event);
>              if (rv && !bus->broadcast) {
>                  if (bus_scanned) {
> @@ -212,6 +213,11 @@ int i2c_start_send(I2CBus *bus, uint8_t address)
>      return i2c_do_start_transfer(bus, address, I2C_START_SEND);
>  }
>  
> +int i2c_start_send_async(I2CBus *bus, uint8_t address)
> +{
> +    return i2c_do_start_transfer(bus, address, I2C_START_SEND_ASYNC);
> +}
> +
>  void i2c_end_transfer(I2CBus *bus)
>  {
>      I2CSlaveClass *sc;
> @@ -261,6 +267,23 @@ int i2c_send(I2CBus *bus, uint8_t data)
>      return ret ? -1 : 0;
>  }
>  
> +int i2c_send_async(I2CBus *bus, uint8_t data)
> +{
> +    I2CNode *node = QLIST_FIRST(&bus->current_devs);
> +    I2CSlave *slave = node->elt;
> +    I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(slave);
> +
> +    if (!sc->send_async) {
> +        return -1;
> +    }
> +
> +    trace_i2c_send_async(slave->address, data);
> +
> +    sc->send_async(slave, data);
> +
> +    return 0;
> +}
> +
>  uint8_t i2c_recv(I2CBus *bus)
>  {
>      uint8_t data = 0xff;
> @@ -297,6 +320,17 @@ void i2c_nack(I2CBus *bus)
>      }
>  }
>  
> +void i2c_ack(I2CBus *bus)
> +{
> +    if (!bus->bh) {
> +        return;
> +    }
> +
> +    trace_i2c_ack();
> +
> +    qemu_bh_schedule(bus->bh);
> +}
> +
>  static int i2c_slave_post_load(void *opaque, int version_id)
>  {
>      I2CSlave *dev = opaque;
> diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
> index 5d10e27664db..feb3ec633350 100644
> --- a/hw/i2c/smbus_slave.c
> +++ b/hw/i2c/smbus_slave.c
> @@ -143,6 +143,10 @@ static int smbus_i2c_event(I2CSlave *s, enum i2c_event event)
>              dev->mode = SMBUS_CONFUSED;
>              break;
>          }
> +        break;
> +
> +    default:
> +        return -1;
>      }
>  
>      return 0;
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index 209275ed2dc8..af181d43ee64 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -4,7 +4,9 @@
>  
>  i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
>  i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
> +i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
>  i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
> +i2c_ack(void) ""
>  
>  # aspeed_i2c.c
>  
> diff --git a/hw/misc/ibm-cffps.c b/hw/misc/ibm-cffps.c
> index 042155bb7838..d69a727fd5f9 100644
> --- a/hw/misc/ibm-cffps.c
> +++ b/hw/misc/ibm-cffps.c
> @@ -152,6 +152,8 @@ static int ibm_cffps_event(I2CSlave *i2c, enum i2c_event event)
>      case I2C_FINISH:
>           s->pointer = 0xFF;
>          break;
> +    default:
> +        return -1;
>      }
>  
>      s->len = 0;
> diff --git a/hw/misc/ir35221.c b/hw/misc/ir35221.c
> index 5e01d3655059..c46b9ee1c3bf 100644
> --- a/hw/misc/ir35221.c
> +++ b/hw/misc/ir35221.c
> @@ -117,6 +117,8 @@ static int ir35221_event(I2CSlave *i2c, enum i2c_event event)
>      case I2C_FINISH:
>           s->pointer = 0xFF;
>          break;
> +    default:
> +        return -1;
>      }
>  
>      s->len = 0;
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 01a3093600fa..d695f6ae894a 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -75,6 +75,8 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>          break;
>      case I2C_NACK:
>          break;
> +    default:
> +        return -1;
>      }
>      return 0;
>  }
> diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
> index 4c98ddbf207c..bb8d48b2fdb0 100644
> --- a/hw/sensor/lsm303dlhc_mag.c
> +++ b/hw/sensor/lsm303dlhc_mag.c
> @@ -427,6 +427,8 @@ static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
>          break;
>      case I2C_NACK:
>          break;
> +    default:
> +        return -1;
>      }
>  
>      s->len = 0;
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index be8bb8b78a60..9b9581d23097 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -12,6 +12,7 @@
>  enum i2c_event {
>      I2C_START_RECV,
>      I2C_START_SEND,
> +    I2C_START_SEND_ASYNC,
>      I2C_FINISH,
>      I2C_NACK /* Masker NACKed a receive byte.  */
>  };
> @@ -28,6 +29,9 @@ struct I2CSlaveClass {
>      /* Master to slave. Returns non-zero for a NAK, 0 for success. */
>      int (*send)(I2CSlave *s, uint8_t data);
>  
> +    /* Master to slave (asynchronous). Receiving slave must call i2c_ack(). */
> +    void (*send_async)(I2CSlave *s, uint8_t data);
> +
>      /*
>       * Slave to master.  This cannot fail, the device should always
>       * return something here.
> @@ -127,11 +131,23 @@ int i2c_start_recv(I2CBus *bus, uint8_t address);
>   */
>  int i2c_start_send(I2CBus *bus, uint8_t address);
>  
> +/**
> + * i2c_start_send_async: start an asynchronous 'send' transfer on an I2C bus.
> + *
> + * @bus: #I2CBus to be used
> + * @address: address of the slave
> + *
> + * Return: 0 on success, -1 on error
> + */
> +int i2c_start_send_async(I2CBus *bus, uint8_t address);
> +
>  void i2c_end_transfer(I2CBus *bus);
>  void i2c_nack(I2CBus *bus);
> +void i2c_ack(I2CBus *bus);
>  void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
>  void i2c_bus_release(I2CBus *bus);
>  int i2c_send(I2CBus *bus, uint8_t data);
> +int i2c_send_async(I2CBus *bus, uint8_t data);
>  uint8_t i2c_recv(I2CBus *bus);
>  bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
>                    I2CNodeList *current_devs);
> -- 
> 2.36.1
> 

--000000000000038ae805e06a1612
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
h9GcbY+5MpwwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIKoofU7k4eE/iiH24pmX
98Jh9Wqz07AcmHJRY+FvYMZjMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIyMDYwMTIyMDUyNFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsG
CWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQC4ojgr85mWSAjiM3BGzN7KxofMnuplGdXMV4x7
dB6zCHeHx67Mo3ynpT/g76Mj9UpT1cLo0/APapzvc2Rbq5shGjowQwvRsvkJbEXYvLH+0rvpXLAJ
e6rE/IYMhdUupUcl9xMYgyjWDGXa4pUlwbLtQ7tg0NFbELqV+BKNCGSMhe2KTAwmue5du7upHLd4
SlvqkUzJHtPoSG9EK1iHY1wd4ysFtW/qh4UXNGa9ZQ1gdhmNRDmdC/iNJ5N07+L5YMYOkkBkwH8+
sfkyzF/1S9AzAMWduTo5/MmhDw/bhD9GEilAdsqCs0wXWRcmctlm58Qq1sR+sxD7daqAyLZi6uVZ
--000000000000038ae805e06a1612--

