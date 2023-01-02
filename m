Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E165B50B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 17:24:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCNan-0000v1-81; Mon, 02 Jan 2023 11:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pCNak-0000uS-Gl; Mon, 02 Jan 2023 11:23:15 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pCNai-000060-RP; Mon, 02 Jan 2023 11:23:14 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 v15-20020a9d69cf000000b006709b5a534aso17673024oto.11; 
 Mon, 02 Jan 2023 08:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xw/awmtsbscJrWkbPVgiQwZL6rCIZ0Qz3hQWSTzPGvk=;
 b=iYY/Ygu5jM8iMgQyjQt9ZiYl/esRVAaAzRwmgFKBcXAuLQI5/mJskF0LcKQjwxU/RV
 TfB8I4vnqHmHr6JP/kXszV4RxoTq2x4VYh7QstqhNruYZE3HhXHp7odHnCyMU0aJr1fS
 bFl5V8ZYhTVC3C6N8+0TeH+YnEdSxJGnAf8k8tRB9hIy6N+JtPvIUGKmt72TyFPki/kl
 XNgTimtzIWMDUQ9m2OQEr4E7LWrSPBl9qcl8PEX6CaeIsYwlHjUIRMBpCar/jUJErfKS
 MKy9gbp/9Rs/6YUfe4DQuaK1kT4sLn3MNteHNFQD6aCgxT5qXRxGUcRh2iFeGkwIwoq2
 Pm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xw/awmtsbscJrWkbPVgiQwZL6rCIZ0Qz3hQWSTzPGvk=;
 b=HZdoUu41rWW7I3C3fAdlCR5swm/zjT3RavoZcbTX/ASirqDpZDd62/kFX1yjyVoPuk
 r9ND9GXRYCKd8LDBg4KNnGbm8xzjc+7k/szrrVraoVyI3RtFm0FwtNCOrcsWfyEIVVmp
 SFbjldB6xutReqHUTXd3GVNvrhoXAOQnxZkqvmmQ1cSeXhs1+sEFdI/rHoVakLQZSLbi
 PwaMVb8M7SsXy0zIcqdWV/35GRca8zr6JJoNs1Jz+l0G00ZbiHp65GV6EVJGUAwVPXkk
 DO6PJQapfKR1SpRk5Yk9y+Rmy6hcqv3q7IVOLj6im0vOKy1pbpg4MYt3Gb5yxYWEqEgw
 YeFw==
X-Gm-Message-State: AFqh2kpOe63dMuHC50HYRUgayw4HCyGgEO52XgIJv7HstoSRFPM1XcUW
 k4PmG2XlbPnMfQoEg1KUlYc=
X-Google-Smtp-Source: AMrXdXuh3OD4qcDL05KvKaHiGLFwy3yXLnrPKuccBwKfVG5/om8Q/R/KeQ1hFEMA51zhmup35tlnmA==
X-Received: by 2002:a9d:7e8a:0:b0:670:9684:404c with SMTP id
 m10-20020a9d7e8a000000b006709684404cmr24734446otp.28.1672676590646; 
 Mon, 02 Jan 2023 08:23:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 cp26-20020a056830661a00b0066da36d2c45sm13835470otb.22.2023.01.02.08.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 08:23:09 -0800 (PST)
Date: Mon, 2 Jan 2023 08:23:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Ben Dooks <ben@fluff.org>,
 Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
Message-ID: <20230102162308.GA1138622@roeck-us.net>
References: <20221221122213.1458540-1-linux@roeck-us.net>
 <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
 <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
 <b00bb842-a9e6-fa5c-94d9-876c241be600@linaro.org>
 <c1f5c868-0006-bb28-af88-eddc5543068e@kaod.org>
 <3044e0c174268312d0323d8f9ad43c68@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3044e0c174268312d0323d8f9ad43c68@walle.cc>
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Jan 02, 2023 at 04:43:49PM +0100, Michael Walle wrote:
> Am 2023-01-02 14:53, schrieb Cédric Le Goater:
> > On 12/27/22 07:31, Tudor Ambarus wrote:
> > > 
> > > 
> > > On 25.12.2022 14:18, Ben Dooks wrote:
> > > > On Wed, Dec 21, 2022 at 06:36:02PM +0100, Cédric Le Goater wrote:
> > > > > On 12/21/22 13:22, Guenter Roeck wrote:
> > > > > > Generated from hardware using the following command and
> > > > > > then padding
> > > > > > with 0xff to fill out a power-of-2:
> > > > > >     xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> > > > > > 
> > > > > > Cc: Michael Walle <michael@walle.cc>
> > > > > > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> > > > > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > > > 
> > > > > Reviewed-by: Cédric Le Goater <clg@kaod.org>
> > > > 
> > > > If SFDP is a standard, couldn't we have an function to generate
> > > > it from
> > > > the flash parameters?
> > > > 
> > > 
> > > No, it's not practical as you have to specify all the flash parameters
> > > at flash declaration.
> > 
> > Indeed and the definition of flash models in QEMU is far to cover all
> > the SFDP
> > features. The known_devices array of m25p80 would be huge ! However, we
> > could
> > generate some of the SFDP tables if no raw data is provided. It could be
> > useful
> > for testing drivers.
> 
> I don't think adding (incomplete) SFDP tables makes sense for any real
> devices. E.g. sometimes our linux driver will look at specific bits in
> SFDP to figure out what particular flash device is attached. For example
> when there are different flashes with the same jedec id.
> 
> But since the last released kernel, we support a generic SFDP driver, which
> is used when there is no matching driver for the flash's jedec id.
> Theoretically, you can build your own flash device (with a unique id) and
> generate the sfdp tables for that one.
> 
How about older kernels versions ? Would those still support such (virtual ?)
flash devices ?

Thanks,
Guenter

