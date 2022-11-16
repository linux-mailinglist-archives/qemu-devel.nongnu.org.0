Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56B62BFE4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:45:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIhx-0006Aq-Ho; Wed, 16 Nov 2022 08:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1ovIhq-00069a-4i; Wed, 16 Nov 2022 08:43:58 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1ovIhn-0006Zq-8S; Wed, 16 Nov 2022 08:43:57 -0500
Received: by mail-qt1-x830.google.com with SMTP id e15so10671903qts.1;
 Wed, 16 Nov 2022 05:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4omc+0YOGReCTDowpzdLBuOie0+O60WGLSRjJMViTg=;
 b=aSQKOofebAYXV0HQCohTXCpfUSV+cJTvoPNWQGZVtYJSNkh6H2Dm0RMKlcNi+TLY7o
 WrnMxwzJofunzsoPjrgKhm719RJWQt5IOdNxj0K3Z83iN7OXQjOIMtoCIyqSerR1vmL3
 kI7L+6O0JVAO9M0HQ3Qvgmbtg9URz7dwxyGIsUQIb28Yixo9H+uy/4xhHt0oeI1YAq5B
 LDtY+AdBsy1+toLzbaxG+97pvUocfEiVnFMPO8+bYxtp2GhUMrVvMfiMNSkIIJ5BhQch
 93M4ghLsABd/ClmJ42PDcDKhYMSmNwYT5Z+J3MGsz4IRyaYMW38kLknES+fsKdH8bNWS
 npZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y4omc+0YOGReCTDowpzdLBuOie0+O60WGLSRjJMViTg=;
 b=KzcVx6iLC3ILbTIwsR9QlGfEIFqY1FxhmlhUK1LiRP2pyLZ62T1hD9S2XTU+e1jMVk
 8kc9ZJosyfnxShevsqhlpBM3Tj0bitfFPqypT8VmbJ53HA9jMUXelGgt1lkev6OqlpRV
 bkkGzL+kq4VR1UjuuUYNdKMxS+Ily4fl8eIUEtoG2r40h3Kn4HPEnuZ/udgOv51ttZs5
 reUNFdG7m2/4rS0C62l7qFNiGCMDMESLbhm02pKQTs4MYJwcpKNfk7sr8Rz1eQkNaO54
 HH9FdH1Ky7FjTFS3s8joFOetWymUXAEQGcScIqEL4mTNHK0Yw2O5eVXp2YMz6e/Z/tvX
 tUcQ==
X-Gm-Message-State: ANoB5pnqsNRNoFm33b5uKL13vTbwC01gPyFC0hu8HQg5q0zOSSkOn2/W
 QZa4OToU4jNy2IwRa1c9mA==
X-Google-Smtp-Source: AA0mqf6m9flJjTFnu7zZbk2Zrehd5134KxhWAzj5J9vN6q+6BY9eLZNTm594EN1jQIceoqScBtRxZA==
X-Received: by 2002:a05:622a:905:b0:3a5:868a:5b86 with SMTP id
 bx5-20020a05622a090500b003a5868a5b86mr20941921qtb.488.1668606232735; 
 Wed, 16 Nov 2022 05:43:52 -0800 (PST)
Received: from serve.minyard.net ([47.184.147.45])
 by smtp.gmail.com with ESMTPSA id
 bm27-20020a05620a199b00b006ecfb2c86d3sm9997562qkb.130.2022.11.16.05.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 05:43:51 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8ecc:833c:f1c:ece1])
 by serve.minyard.net (Postfix) with ESMTPSA id 663E2180044;
 Wed, 16 Nov 2022 13:43:50 +0000 (UTC)
Date: Wed, 16 Nov 2022 07:43:49 -0600
From: Corey Minyard <minyard@acm.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Message-ID: <Y3TpFUNxtlWyd48g@minyard.net>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116084312.35808-2-its@irrelevant.dk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 09:43:10AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> It is not given that the current master will release the bus after a
> transfer ends. Only schedule a pending master if the bus is idle.
> 

Yes, I think this is correct.

Acked-by: Corey Minyard <cminyard@mvista.com>

Is there a reason you are thinking this is needed for 7.2?  There's no
code in qemu proper that uses this yet.  I had assumed that was coming
soon after the patch.

-corey

> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/i2c/aspeed_i2c.c  |  2 ++
>  hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
>  include/hw/i2c/i2c.h |  2 ++
>  3 files changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index c166fd20fa11..1f071a3811f7 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>          }
>          SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
>          aspeed_i2c_set_state(bus, I2CD_IDLE);
> +
> +        i2c_schedule_pending_master(bus->bus);
>      }
>  
>      if (aspeed_i2c_bus_pkt_mode_en(bus)) {
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index d4ba8146bffb..bed594fe599b 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -185,22 +185,39 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>  
>  void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
>  {
> +    I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
> +    node->bh = bh;
> +
> +    QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
> +}
> +
> +void i2c_schedule_pending_master(I2CBus *bus)
> +{
> +    I2CPendingMaster *node;
> +
>      if (i2c_bus_busy(bus)) {
> -        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
> -        node->bh = bh;
> -
> -        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
> +        /* someone is already controlling the bus; wait for it to release it */
> +        return;
> +    }
>  
> +    if (QSIMPLEQ_EMPTY(&bus->pending_masters)) {
>          return;
>      }
>  
> -    bus->bh = bh;
> +    node = QSIMPLEQ_FIRST(&bus->pending_masters);
> +    bus->bh = node->bh;
> +
> +    QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
> +    g_free(node);
> +
>      qemu_bh_schedule(bus->bh);
>  }
>  
>  void i2c_bus_release(I2CBus *bus)
>  {
>      bus->bh = NULL;
> +
> +    i2c_schedule_pending_master(bus);
>  }
>  
>  int i2c_start_recv(I2CBus *bus, uint8_t address)
> @@ -234,16 +251,6 @@ void i2c_end_transfer(I2CBus *bus)
>          g_free(node);
>      }
>      bus->broadcast = false;
> -
> -    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
> -        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
> -        bus->bh = node->bh;
> -
> -        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
> -        g_free(node);
> -
> -        qemu_bh_schedule(bus->bh);
> -    }
>  }
>  
>  int i2c_send(I2CBus *bus, uint8_t data)
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 9b9581d23097..2a3abacd1ba6 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -141,6 +141,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
>   */
>  int i2c_start_send_async(I2CBus *bus, uint8_t address);
>  
> +void i2c_schedule_pending_master(I2CBus *bus);
> +
>  void i2c_end_transfer(I2CBus *bus);
>  void i2c_nack(I2CBus *bus);
>  void i2c_ack(I2CBus *bus);
> -- 
> 2.38.1
> 
> 

