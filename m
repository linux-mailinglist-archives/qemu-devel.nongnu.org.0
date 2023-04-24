Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F006ED206
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:06:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyi9-0003ml-8K; Mon, 24 Apr 2023 12:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pqyi6-0003m5-6k
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:06:38 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pqyhz-0000QW-I7
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:06:37 -0400
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-5ef4d54a583so21712136d6.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682352390; x=1684944390;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=t6NHte7FLgF36R6hwuBMQP8/FtSt0daPK9EQvBDwKJg=;
 b=FxWbs5ENWejxWrgolm5wzseJ9I+1ZYWQA7+4yUjDUXY0+sYTFsdd4LcWhDZqrEcfcK
 jErgpoufQKN1UBM8DxZJwyBEqFTq8Elibf2vJh67suzxSPQIBIWZ7GvXXWs4fujzkerN
 sqLj9gF0As5Y2fbAB0k83tlR3fGeqY2jhfu3njqk+DtrFzTBSsjm9pzccbaR7r2gkTg3
 6cfCd3OYK4FihmmgAqdcRd4McwIK0r+VaHSxxgziox5xvFzLeSulD98bQAwPJO3nrahq
 0I3Ddh0QHXek3aMvW8F4GNuwX2B4xGMWzpiOa+LOTFPYXHOqWdJu4N9E0vAwvnUTf/Li
 rA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682352390; x=1684944390;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t6NHte7FLgF36R6hwuBMQP8/FtSt0daPK9EQvBDwKJg=;
 b=X7Z+rb/j6ZPNFR+9PdQ+pOmhftsrSsKqsWDF731Qq+5wxl1vO/frICWn7D+8+qr21E
 uaHRyO2cAfkf5ph2hXtEFepLLD5cO3OlAH6lXH1BoPUSQ2vAMTyqZT7N9sjeFMEcgnG6
 RiyKD5pPM9oxXGNaSn1QovL6SrHrIOvVY6/GEUl4JEjYr3/X7CJIZ2bgoumvI9fkLlFB
 HHiAvq8RyYqYdwOACa4DkHePMHfyWYkMa/4UbAeUX/EjsVs0AX28x1+kCZ8sR9uybDow
 LiJtJG1dGpf5N6cx/hdIFXCQTfFVsKQOQz8U4uF3vkDAATXfyH2nwPcdsuDZKKP0BAY1
 xahQ==
X-Gm-Message-State: AAQBX9cYc4TlRBcL8UM1t519FLnt484ggMT90k8RL0B1aZW8Gk1rqljz
 Yijq5XPWyWRBhVPM2SRbAg==
X-Google-Smtp-Source: AKy350bXPaVGrNNwNDcMoViMF1LSubk52jSVAjmWO/SOWIaX5mxDQE7i/zY83RjAjEW4huKd+UADyw==
X-Received: by 2002:a05:6214:27c2:b0:5ad:2a05:ddd1 with SMTP id
 ge2-20020a05621427c200b005ad2a05ddd1mr25639549qvb.34.1682352389806; 
 Mon, 24 Apr 2023 09:06:29 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a0ccd8e000000b006039f5a247esm2825934qvm.78.2023.04.24.09.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 09:06:29 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:c726:632b:4e49:cbad])
 by serve.minyard.net (Postfix) with ESMTPSA id 47EF61800BA;
 Mon, 24 Apr 2023 16:06:28 +0000 (UTC)
Date: Mon, 24 Apr 2023 11:06:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Karol Nowak <knw@spyro-soft.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "clg@kaod.org" <clg@kaod.org>
Subject: Re: [RFC PATCH v1] hw/misc: add i2c slave device that passes i2c ops
 outside
Message-ID: <ZEapA5GBZA79fibu@minyard.net>
References: <PAXP193MB16793F753AA32E8FAA831D7B83879@PAXP193MB1679.EURP193.PROD.OUTLOOK.COM>
 <ZBx4NBzCFmyTslSL@minyard.net>
 <PAXP193MB1679F9784BF889EBDE651223839C9@PAXP193MB1679.EURP193.PROD.OUTLOOK.COM>
 <ZD1Y8WDsiGH/sEtT@minyard.net>
 <PAXP193MB16797EC1DF4746EEC43C1C9383629@PAXP193MB1679.EURP193.PROD.OUTLOOK.COM>
 <ZD/8K3ehrkde1Bwx@minyard.net>
 <PAXP193MB16796DF93408ED1199B4C0F583679@PAXP193MB1679.EURP193.PROD.OUTLOOK.COM>
 <ZEan/z4xdTpwPYGd@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEan/z4xdTpwPYGd@minyard.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Mon, Apr 24, 2023 at 11:02:08AM -0500, Corey Minyard wrote:
> On Mon, Apr 24, 2023 at 02:09:50PM +0000, Karol Nowak wrote:
> > Hi Corey,
> > 
> > 
> > 
> > Have you got a chance to look at the I2C code?
> 
> No, I have not.  I've been pretty busy with work stuff.
> 
> > 
> > 
> > I imagine that the I2C code has to stop the emulation and keep the main thread running so that it can receive events. Is there something like that?
> 
> No, not really.
> 
> Right now an I2C host device will submit its transactions on the virtual
> bus and get an immediate response.  Basically, they call send() for all
> the bytes and then call recv() to get the response.  Your additions
> would require blocking on each send() and recv() until the other end of
> the connection responded.
> 
> The fundamental thing that must happen is that the individual I2C host
> devices need to be modified to submit their transactions asynchronously,
> they do a send_async(), to write bytes, and have some asyncronous way to
> receive the bytes (which is going to be a little tricky, I think).
> 
> There is already a send_async() function available.  This is added so
> that external devices can bus master, but would be usable for a host
> device to talk to a slave.

I should also add that I'm not 100% sure that a blocking interface is
just a bad idea.  I am fairly sure it would be a bad idea for
production, but for test systems it might be ok.

The trouble is that once you put something in for test systems, someone
will want to use it for production systems.  So I would really rather do
it right the first time.  But other QEMU developers that are more
experienced than me can convince me otherwise.

-corey

> 
> -corey
> 
> > 
> > 
> > 
> > Karol
> > 
> > 
> > ________________________________
> > From: Corey Minyard <tcminyard@gmail.com> on behalf of Corey Minyard <minyard@acm.org>
> > Sent: Wednesday, April 19, 2023 4:35 PM
> > To: Karol Nowak <knw@spyro-soft.com>
> > Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; philmd@linaro.org <philmd@linaro.org>; clg@kaod.org <clg@kaod.org>
> > Subject: Re: [RFC PATCH v1] hw/misc: add i2c slave device that passes i2c ops outside
> > 
> > ⚠ This email originates from outside the organization or the sender could not be verified.
> > 
> > On Wed, Apr 19, 2023 at 12:40:36PM +0000, Karol Nowak wrote:
> > > Hi Corey,
> > >
> > > I looked at hw/ipmi/ipmi_bmc_extern.c and I conclude that it is a bit different case than in my one. The function ipmi_bmc_extern_handle_command() does not wait for a response; the response comes in a chardev-handler. If I am not mistaken, in my case I have to arm a timer to avoid hanging of QEMU, somehow stop execution of i2c-handler(recv/send/event), wait for a response in a chardev handler and then resume an execution of i2c-handler when data arrive.
> > 
> > Yes, something like that.  Hopefully a timer isn't necessary (well, it's
> > necessary to make sure you don't sit there forever, but it shouldn't be
> > the main way to do it), you can use the response from the other end to
> > resume execution.
> > 
> > You don't stop execution of the i2c handler, either.  You aren't blocked
> > waiting for a response, that's the big thing you cannot do.  You send
> > the message and return.  When the response comes in, you do what the
> > hardware would do in that case.
> > 
> > I need to spend a little time looking at the I2C code.  I assume it
> > would need some adjustment to accommodate this.
> > 
> > -corey
> > 
> > >
> > > Best regards,
> > > Karol
> > >
> > >
> > >
> > > ________________________________
> > > From: Corey Minyard <tcminyard@gmail.com> on behalf of Corey Minyard <minyard@acm.org>
> > > Sent: Monday, April 17, 2023 4:34 PM
> > > To: Karol Nowak <knw@spyro-soft.com>
> > > Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; philmd@linaro.org <philmd@linaro.org>; clg@kaod.org <clg@kaod.org>
> > > Subject: Re: [RFC PATCH v1] hw/misc: add i2c slave device that passes i2c ops outside
> > >
> > > [You don't often get email from minyard@acm.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > ⚠ This email originates from outside the organization or the sender could not be verified.
> > >
> > > On Mon, Apr 17, 2023 at 10:18:08AM +0000, Karol Nowak wrote:
> > > > Hi Corey,
> > > >
> > > >
> > > > thank you for your response.
> > > >
> > > >
> > > > Could you give me some hints how to make IO operations non-blocking in QEMU? Is there a code reference in the source code of QEMU I could use?
> > > >
> > >
> > > You can look at hw/ipmi/ipmi_bmc_extern.c for an example.
> > >
> > > -corey
> > >
> > > >
> > > > Karol
> > > >
> > > >
> > > > ________________________________
> > > > From: Corey Minyard <tcminyard@gmail.com> on behalf of Corey Minyard <minyard@acm.org>
> > > > Sent: Thursday, March 23, 2023 5:03 PM
> > > > To: Karol Nowak <knw@spyro-soft.com>
> > > > Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; philmd@linaro.org <philmd@linaro.org>; clg@kaod.org <clg@kaod.org>
> > > > Subject: Re: [RFC PATCH v1] hw/misc: add i2c slave device that passes i2c ops outside
> > > >
> > > > [You don't often get email from minyard@acm.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > >
> > > > ⚠ This email originates from outside the organization or the sender could not be verified.
> > > >
> > > > On Thu, Mar 23, 2023 at 10:09:02AM +0000, Karol Nowak wrote:
> > > > > Hi,
> > > > >
> > > > > There is a feature I prepared which may be practical for some QEMU users.
> > > > >
> > > > > The feature provides a new I2C slave device
> > > > > that prepares a message depending what i2c-slave callback was called
> > > > > and sends it outside of QEMU through the character device to a client
> > > > > that receives that message, processes it and send back a response.
> > > > > Thanks to that feature,
> > > > > a user can emulate a logic of I2C device outside of QEMU.
> > > > > The message contains 3 bytes ended with CRLF: BBB\r\l
> > > > > Basically, the I2C slave does 4 steps in each i2c-slave callback:
> > > > > * encode
> > > > > * send
> > > > > * receive
> > > > > * decode
> > > > >
> > > > > I put more details in esp32_i2c_tcp_slave.c
> > > > > and also provided a demo client in python that uses TCP.
> > > > >
> > > > > The feature still needs some improvements, but the question is:
> > > > > * Do you find the feature useful?
> > > >
> > > > Someone else has proposed this before with a patch, and it was actually
> > > > pretty complete and mostly ok, but I pointed out an issue and never
> > > > heard back from them.  This feature is something that might be nice.  As
> > > > you say, this needs some improvements.  Some I would point out:
> > > >
> > > > Obviously this can't be named esp32, it needs to be general.
> > > >
> > > > All the I/O (reading and writing) has to be non-blocking.  I/O handling
> > > > in qemu is single-threaded, if you block anywhere you basically stop
> > > > qemu.  You need to implement something where whatever you do (like
> > > > handling a NAK, for instance) it doesn't block qemu.
> > > >
> > > > The protocol you have implemented is basically an extension of the QEMU
> > > > protocol.  That's probably not ideal, it would be best to think about a
> > > > general protocol for extending I2C over a TCP connection.  A lot of the
> > > > details of the QEMU implementation is probably not necessary over a TCP
> > > > connection.
> > > >
> > > > -corey
> > > >
> > > > >
> > > > >
> > > > > NOTE:
> > > > > The feature originally was prepared for espressif/qemu
> > > > > that's why there are references to esp32
> > > > >
> > > > >
> > > > > Signed-off-by: Karol Nowak <knw@spyro-soft.com>
> > > > > ---
> > > > >  hw/misc/esp32_i2c_tcp_slave.c         | 288 ++++++++++++++++++++++++++
> > > > >  include/hw/misc/esp32_i2c_tcp_slave.h |  19 ++
> > > > >  tests/i2c-tcp-demo/i2c-tcp-demo.py    | 133 ++++++++++++
> > > > >  3 files changed, 440 insertions(+)
> > > > >  create mode 100644 hw/misc/esp32_i2c_tcp_slave.c
> > > > >  create mode 100644 include/hw/misc/esp32_i2c_tcp_slave.h
> > > > >  create mode 100644 tests/i2c-tcp-demo/i2c-tcp-demo.py
> > > > >
> > > > > diff --git a/hw/misc/esp32_i2c_tcp_slave.c b/hw/misc/esp32_i2c_tcp_slave.c
> > > > > new file mode 100644
> > > > > index 0000000000..db3b6d366a
> > > > > --- /dev/null
> > > > > +++ b/hw/misc/esp32_i2c_tcp_slave.c
> > > > > @@ -0,0 +1,288 @@
> > > > > +#include "qemu/osdep.h"
> > > > > +#include "qemu/error-report.h"
> > > > > +#include "qemu/log.h"
> > > > > +#include "hw/i2c/i2c.h"
> > > > > +#include "hw/irq.h"
> > > > > +#include "hw/misc/esp32_i2c_tcp_slave.h"
> > > > > +#include "qemu/module.h"
> > > > > +
> > > > > +#include "qapi/qmp/json-writer.h"
> > > > > +#include "chardev/char-fe.h"
> > > > > +#include "io/channel-socket.h"
> > > > > +#include "chardev/char-io.h"
> > > > > +#include "chardev/char-socket.h"
> > > > > +#include "qapi/error.h"
> > > > > +
> > > > > +/*
> > > > > + * Description:
> > > > > + * To allow to emulate a I2C slave device which is not supported by QEMU,
> > > > > + * a new I2C slave device was created that encapsulates I2C operations
> > > > > + * and passes them through a selected chardev to the host
> > > > > + * where a client resides that implements a logic of emulated device.
> > > > > + *
> > > > > + *
> > > > > + * Architecture:
> > > > > + *    ---------------------------
> > > > > + *    | QEMU                    |
> > > > > + *    |                         |         -----------------------
> > > > > + *    |  ESP32 Firmware writes  |         |                     |
> > > > > + *    |  to I2C Slave           |         | I2C Slave Emulation |
> > > > > + *    |                         |         |                     |
> > > > > + *    |  -----------------------&---------&----                 |
> > > > > + *    |  | I2C Slave at 0x7F    &   tcp   &     recv msg        |
> > > > > + *    |  -----------------------&---------&---- process msg     |
> > > > > + *    |                         |         |     send respone    |
> > > > > + *    |                         |         |                     |
> > > > > + *    |                         |         |                     |
> > > > > + *    ---------------------------         |----------------------
> > > > > + *
> > > > > + *
> > > > > + * Syntax & protocol:
> > > > > + *      QEMU I2C Slave sends a msg in following format: BBB\r\n
> > > > > + *      where each 'B' represents a single byte 0-255
> > > > > + *      QEMU I2C Slave expects a respone message in the same format as fast as possible
> > > > > + *      Example:
> > > > > + *         req: 0x45 0x01 0x00 \r\n
> > > > > + *        resp: 0x45 0x01 0x00 \r\n
> > > > > + *
> > > > > + *      The format BBB\r\n
> > > > > + *        first 'B' is a message type
> > > > > + *        second 'B' is a data value
> > > > > + *        third 'B' is an error value (not used at the moment)
> > > > > + *
> > > > > + *      There are three types of message
> > > > > + *        'E' or 0x45 - Event:
> > > > > + *        'S' or 0x53 - Send: byte sent to emulated I2C Slave
> > > > > + *        'R' or 0x52 - Recv: byte to be received by I2C Master
> > > > > + *
> > > > > + *
> > > > > + *      'E' message
> > > > > + *        second byte is an event type:
> > > > > + *         0x0: I2C_START_RECV
> > > > > + *         0x1: I2C_START_SEND
> > > > > + *         0x2: I2C_START_SEND_ASYNC
> > > > > + *         0x3: I2C_FINISH
> > > > > + *         0x4: I2C_NACK
> > > > > + *
> > > > > + *        Example:
> > > > > + *            0x45 0x01 0x00  - start send
> > > > > + *            0x45 0x03 0x00  - finish
> > > > > + *
> > > > > + *        In case of 'E' message, a response is the same as a request message
> > > > > + *
> > > > > + *      'S' message
> > > > > + *        second byte is a byte transmitted from I2C Master to I2C slave device
> > > > > + *        the byte to by processed by I2C Slave Device
> > > > > + *
> > > > > + *        Example:
> > > > > + *            0x53 0x20 0x00
> > > > > + *
> > > > > + *        In case of 'S' message, a response is the same as a request message
> > > > > + *
> > > > > + *      'R' message
> > > > > + *        the I2C Master expect a byte from the emulated i2c slave device
> > > > > + *        A client has to modify the second byte of the request message
> > > > > + *         and send it back as a response.
> > > > > + *
> > > > > + *        Example:
> > > > > + *             req: 0x52 0x00 0x00
> > > > > + *            resp: 0x52 0x11 0x00
> > > > > + *
> > > > > + *
> > > > > + * Examples of Transmission:
> > > > > + *     1) i2cset -c 0x7F -r 0x20 0x11 0x22 0x33 0x44 0x55
> > > > > + *          req: 45 01 00
> > > > > + *         resp: 45 01 00
> > > > > + *
> > > > > + *          req: 53 20 00
> > > > > + *         resp: 53 20 00
> > > > > + *
> > > > > + *          req: 53 11 00
> > > > > + *         resp: 53 11 00
> > > > > + *
> > > > > + *          req: 53 22 00
> > > > > + *         resp: 53 22 00
> > > > > + *
> > > > > + *          req: 53 33 00
> > > > > + *         resp: 53 33 00
> > > > > + *
> > > > > + *          req: 53 44 00
> > > > > + *         resp: 53 44 00
> > > > > + *
> > > > > + *          req: 53 55 00
> > > > > + *         resp: 53 55 00
> > > > > + *
> > > > > + *          req: 45 03 00
> > > > > + *         resp: 45 03 00
> > > > > + *
> > > > > + *     2) i2cget -c 0x7F -r 0x20 -l 0x03
> > > > > + *          req: 45 01 00
> > > > > + *         resp: 45 01 00
> > > > > + *
> > > > > + *          req: 53 20 00
> > > > > + *         resp: 53 20 00
> > > > > + *
> > > > > + *          req: 45 03 00
> > > > > + *         resp: 45 03 00
> > > > > + *
> > > > > + *          req: 45 00 00
> > > > > + *         resp: 45 00 00
> > > > > + *
> > > > > + *          req: 52 00 00
> > > > > + *         resp: 52 11 00
> > > > > + *
> > > > > + *          req: 52 00 00
> > > > > + *         resp: 52 22 00
> > > > > + *
> > > > > + *          req: 52 00 00
> > > > > + *         resp: 52 33 00
> > > > > + *
> > > > > + *          req: 45 03 00
> > > > > + *         resp: 45 03 00
> > > > > + *
> > > > > + *
> > > > > + * To start i2c.socket server, set QEMU param:
> > > > > + *   -chardev socket,port=16001,wait=no,host=localhost,server=on,ipv4=on,id=i2c.socket
> > > > > + *
> > > > > + * Simple demo I2C Slave Emulation in Python:
> > > > > + *   tests/i2c-tcp-demo/i2c-tcp-demo.py
> > > > > + *
> > > > > + * Limitations:
> > > > > + *   - there is no recv timeout which may lead to qemu hang
> > > > > + *
> > > > > + */
> > > > > +
> > > > > +#define CHARDEV_NAME "i2c.socket"
> > > > > +
> > > > > +static Chardev *chardev;
> > > > > +static CharBackend char_backend;
> > > > > +static bool chardev_open;
> > > > > +
> > > > > +typedef struct {
> > > > > +    uint8_t id;
> > > > > +    uint8_t byte;
> > > > > +    uint8_t err;
> > > > > +} packet;
> > > > > +
> > > > > +static int chr_can_receive(void *opaque)
> > > > > +{
> > > > > +    return CHR_READ_BUF_LEN;
> > > > > +}
> > > > > +
> > > > > +static void chr_event(void *opaque, QEMUChrEvent event)
> > > > > +{
> > > > > +    switch (event) {
> > > > > +    case CHR_EVENT_OPENED:
> > > > > +        qemu_log("connected\n");
> > > > > +        chardev_open = true;
> > > > > +        break;
> > > > > +    case CHR_EVENT_CLOSED:
> > > > > +        qemu_log("disconnected\n");
> > > > > +        chardev_open = false;
> > > > > +        break;
> > > > > +    case CHR_EVENT_BREAK:
> > > > > +    case CHR_EVENT_MUX_IN:
> > > > > +    case CHR_EVENT_MUX_OUT:
> > > > > +        /* Ignore */
> > > > > +        break;
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void send_packet(packet *p)
> > > > > +{
> > > > > +    static const char *PACKET_FMT = "%c%c%c\r\n";
> > > > > +    static char buff[32];
> > > > > +
> > > > > +    /* encode */
> > > > > +    int len = snprintf(buff, sizeof(buff), PACKET_FMT, p->id, p->byte, p->err);
> > > > > +
> > > > > +    /* send */
> > > > > +    qemu_chr_fe_write_all(&char_backend, (uint8_t *)buff, len);
> > > > > +
> > > > > +    /* receive */
> > > > > +    qemu_chr_fe_read_all(&char_backend, (uint8_t *)buff, len);
> > > > > +
> > > > > +    /* decode */
> > > > > +    sscanf(buff, PACKET_FMT, &p->id, &p->byte, &p->err);
> > > > > +}
> > > > > +
> > > > > +static uint8_t slave_rx(I2CSlave *i2c)
> > > > > +{
> > > > > +    packet p = {.id = 'R',
> > > > > +                .byte = 0,
> > > > > +                .err = 0};
> > > > > +
> > > > > +    send_packet(&p);
> > > > > +
> > > > > +    return p.byte;
> > > > > +}
> > > > > +
> > > > > +static int slave_tx(I2CSlave *i2c, uint8_t data)
> > > > > +{
> > > > > +    packet p = {.id = 'S',
> > > > > +                .byte = data,
> > > > > +                .err = 0};
> > > > > +
> > > > > +    send_packet(&p);
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static int slave_event(I2CSlave *i2c, enum i2c_event event)
> > > > > +{
> > > > > +    packet p = {.id = 'E',
> > > > > +                .byte = event,
> > > > > +                .err = 0};
> > > > > +
> > > > > +    send_packet(&p);
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static void slave_realize(DeviceState *dev, Error **errp)
> > > > > +{
> > > > > +}
> > > > > +
> > > > > +static void slave_init(Object *obj)
> > > > > +{
> > > > > +    Error *err = NULL;
> > > > > +    chardev = qemu_chr_find(CHARDEV_NAME);
> > > > > +    if (!chardev) {
> > > > > +        error_report("chardev '%s' not found", CHARDEV_NAME);
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (!qemu_chr_fe_init(&char_backend, chardev, &err)) {
> > > > > +        error_report_err(err);
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    qemu_chr_fe_set_handlers(&char_backend, chr_can_receive, NULL, chr_event,
> > > > > +                             NULL, NULL, NULL, true);
> > > > > +}
> > > > > +
> > > > > +static void slave_class_init(ObjectClass *klass, void *data)
> > > > > +{
> > > > > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > > > > +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> > > > > +
> > > > > +    dc->realize = slave_realize;
> > > > > +    k->event = slave_event;
> > > > > +    k->recv = slave_rx;
> > > > > +    k->send = slave_tx;
> > > > > +}
> > > > > +
> > > > > +static const TypeInfo esp32_i2c_tcp_info = {
> > > > > +    .name = TYPE_ESP32_I2C_TCP,
> > > > > +    .parent = TYPE_I2C_SLAVE,
> > > > > +    .instance_size = sizeof(ESP32_I2C_TCP_State),
> > > > > +    .instance_init = slave_init,
> > > > > +    .class_init = slave_class_init,
> > > > > +};
> > > > > +
> > > > > +static void esp32_i2c_tcp_type_init(void)
> > > > > +{
> > > > > +    type_register_static(&esp32_i2c_tcp_info);
> > > > > +}
> > > > > +
> > > > > +type_init(esp32_i2c_tcp_type_init);
> > > > > diff --git a/include/hw/misc/esp32_i2c_tcp_slave.h b/include/hw/misc/esp32_i2c_tcp_slave.h
> > > > > new file mode 100644
> > > > > index 0000000000..e36bac7ffe
> > > > > --- /dev/null
> > > > > +++ b/include/hw/misc/esp32_i2c_tcp_slave.h
> > > > > @@ -0,0 +1,19 @@
> > > > > +/*
> > > > > + */
> > > > > +#ifndef QEMU_ESP32_I2C_TCP_SLAVE_H
> > > > > +#define QEMU_ESP32_I2C_TCP_SLAVE_H
> > > > > +
> > > > > +#include "hw/i2c/i2c.h"
> > > > > +#include "qom/object.h"
> > > > > +
> > > > > +#define TYPE_ESP32_I2C_TCP "esp32_i2c_tcp"
> > > > > +OBJECT_DECLARE_SIMPLE_TYPE(ESP32_I2C_TCP_State, ESP32_I2C_TCP)
> > > > > +
> > > > > +/**
> > > > > + */
> > > > > +struct ESP32_I2C_TCP_State {
> > > > > +    /*< private >*/
> > > > > +    I2CSlave i2c;
> > > > > +};
> > > > > +
> > > > > +#endif
> > > > > diff --git a/tests/i2c-tcp-demo/i2c-tcp-demo.py b/tests/i2c-tcp-demo/i2c-tcp-demo.py
> > > > > new file mode 100644
> > > > > index 0000000000..d4bec457f3
> > > > > --- /dev/null
> > > > > +++ b/tests/i2c-tcp-demo/i2c-tcp-demo.py
> > > > > @@ -0,0 +1,133 @@
> > > > > +import json
> > > > > +from twisted.internet import task
> > > > > +from twisted.internet.defer import Deferred
> > > > > +from twisted.internet.protocol import ClientFactory
> > > > > +from twisted.protocols.basic import LineReceiver
> > > > > +from dataclasses import dataclass
> > > > > +from enum import Enum
> > > > > +
> > > > > +# i2cset -c 0x7F -r 0x20 0x11 0x22 0x33 0x44 0x55
> > > > > +# i2cget -c 0x7F -r 0x20 -l 0x0A
> > > > > +
> > > > > +HOST = "localhost"
> > > > > +PORT = 16001
> > > > > +
> > > > > +
> > > > > +class EVENT(Enum):
> > > > > +    I2C_START_RECV = 0
> > > > > +    I2C_START_SEND = 1
> > > > > +    I2C_START_SEND_ASYNC = 2
> > > > > +    I2C_FINISH = 3
> > > > > +    I2C_NACK = 4
> > > > > +
> > > > > +
> > > > > +@dataclass
> > > > > +class I2CSlave:
> > > > > +    mem: bytearray = bytearray(256)
> > > > > +    mem_addr: int = 0
> > > > > +    curr_addr: int = 0
> > > > > +    first_send: bool = True
> > > > > +    recv_conuter: int = 0
> > > > > +
> > > > > +
> > > > > +i2cslave = I2CSlave()
> > > > > +
> > > > > +
> > > > > +def dump_mem():
> > > > > +    print("Mem:")
> > > > > +    bytes_per_row = 32
> > > > > +    rows = int(256 / bytes_per_row)
> > > > > +    for i in range(0, rows):
> > > > > +        begin = i*bytes_per_row
> > > > > +        end = begin+bytes_per_row
> > > > > +        prefix = hex(begin)
> > > > > +        if i == 0:
> > > > > +            prefix = "0x00"
> > > > > +        print(prefix + ": " + i2cslave.mem[begin:end].hex(" "))
> > > > > +
> > > > > +    print("\n")
> > > > > +
> > > > > +
> > > > > +def event_handler(packet):
> > > > > +    evt = EVENT(packet[1])
> > > > > +    print("Event handler: " + evt.name)
> > > > > +
> > > > > +    if evt is EVENT.I2C_FINISH:
> > > > > +        i2cslave.recv_conuter = 0
> > > > > +        i2cslave.first_send = True
> > > > > +        dump_mem()
> > > > > +
> > > > > +    return packet
> > > > > +
> > > > > +
> > > > > +def recv_handler(packet):
> > > > > +    print("Recv handler: byte number " + str(i2cslave.recv_conuter) +
> > > > > +          " from addr=" + hex(i2cslave.mem_addr) +
> > > > > +          ", val=" + hex(i2cslave.mem[i2cslave.mem_addr]))
> > > > > +    i2cslave.recv_conuter += 1
> > > > > +    resp = bytearray(packet)
> > > > > +    resp[1] = i2cslave.mem[i2cslave.mem_addr]
> > > > > +    i2cslave.mem_addr += 1
> > > > > +    if i2cslave.mem_addr == 256:
> > > > > +        i2cslave.mem_addr = 0
> > > > > +    return bytes(resp)
> > > > > +
> > > > > +
> > > > > +def send_handler(packet):
> > > > > +    print("Send handler: ", end='')
> > > > > +    if i2cslave.first_send == True:
> > > > > +        print("address byte: ", hex(packet[1]))
> > > > > +        i2cslave.mem_addr = packet[1]
> > > > > +        i2cslave.first_send = False
> > > > > +    else:
> > > > > +        print("data byte: ", hex(packet[1]))
> > > > > +        i2cslave.mem[i2cslave.mem_addr] = packet[1]
> > > > > +        i2cslave.mem_addr += 1
> > > > > +        if i2cslave.mem_addr == 256:
> > > > > +            i2cslave.mem_addr = 0
> > > > > +    return packet
> > > > > +
> > > > > +
> > > > > +handlers = {'E': event_handler, 'R': recv_handler, 'S': send_handler}
> > > > > +
> > > > > +
> > > > > +class PacketReceiver(LineReceiver):
> > > > > +    def __init__(self) -> None:
> > > > > +        super().__init__()
> > > > > +
> > > > > +    def connectionMade(self):
> > > > > +        print("connected")
> > > > > +
> > > > > +    def lineReceived(self, line):
> > > > > +        # print(line.hex(" "))
> > > > > +        resp = line
> > > > > +        if len(line) == 3:
> > > > > +            resp = handlers[chr(line[0])](line)
> > > > > +
> > > > > +        self.sendLine(resp)
> > > > > +
> > > > > +
> > > > > +class PacketReceiverFactory(ClientFactory):
> > > > > +    protocol = PacketReceiver
> > > > > +
> > > > > +    def __init__(self):
> > > > > +        self.done = Deferred()
> > > > > +
> > > > > +    def clientConnectionFailed(self, connector, reason):
> > > > > +        print("connection failed:", reason.getErrorMessage())
> > > > > +        self.done.errback(reason)
> > > > > +
> > > > > +    def clientConnectionLost(self, connector, reason):
> > > > > +        print("connection lost:", reason.getErrorMessage())
> > > > > +        self.done.callback(None)
> > > > > +
> > > > > +
> > > > > +def main(reactor):
> > > > > +    dump_mem()
> > > > > +    factory = PacketReceiverFactory()
> > > > > +    reactor.connectTCP(HOST, PORT, factory)
> > > > > +    return factory.done
> > > > > +
> > > > > +
> > > > > +if __name__ == "__main__":
> > > > > +    task.react(main)
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >
> > > > > Please consider the environment before printing this e-mail.
> > > > > ________________________________
> > > > > This e-mail (including any attachments) is intended solely for the use of the individual or entity to which it is addressed and may contain confidential information. This message is not a binding agreement and does not conclude an agreement without the express confirmation of the sender's superior or a director of the company.
> > > > > If you are not the intended recipient, you should immediately notify the sender and delete the message along all the attachments. Any disclosure, copying, distribution or any other action is prohibited and may be illegal. No e-mail transmission can be guaranteed to be 100% secure or error-free, as information could be intercepted, corrupted, lost, destroyed, arrive late or incomplete, or contain viruses. Although Spyrosoft has taken precautions to ensure that this e-mail is free from viruses, the company does not accept liability for any errors or omissions in the content of this message, which arise as a result of the e-mail transmission. This e-mail is deemed to be professional in nature. Spyrosoft does not permit the employees to send emails which contravene provisions of the law.

