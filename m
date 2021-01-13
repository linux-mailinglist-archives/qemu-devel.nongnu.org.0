Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA362F4C63
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:44:14 +0100 (CET)
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgRZ-0001Fl-IU
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgPI-0000d4-9I
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgPG-0001dI-6i
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545307;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1M1HVPG5x/EzzQTgE+1UfMy6ZGLaTVSVKbBp8UB9Hvw=;
 b=ZQ9lh9HgwI84W1jxYmj7gpD5Bw3eJQxc6CMCo5WHha5WpLhA/VJrzvgdy2fWkkOcz+/Ycl
 +dtGeBbrxz4hFEqkOl0V173k6Lle7w08X6FddhZyWNAvU8H/Z/molzi6TpOg2OSZamhV2X
 8FAwG0s76jGrjj3tVzLr3alzE+kVG2g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-yC9m-JCkNXuhrZhUbxhP1w-1; Wed, 13 Jan 2021 08:41:46 -0500
X-MC-Unique: yC9m-JCkNXuhrZhUbxhP1w-1
Received: by mail-wm1-f69.google.com with SMTP id b194so308785wmd.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N2MHTxwdhCvA6Y9T2q3kdbtmuus9DH5udATDeE2ah9Y=;
 b=kPWzn8O80iw0VUTqpdT9DHi8Uk74aTgkoK/7b2Kh1o8H0odzfLZDMGpVvtf7OaxzQ/
 IuDwDWacx85e+ercQnhLtPw41qwIeoWAp3wI9SGoYNvUkCIpSh/GaXcMaoxpyNIfpy6F
 fsThaRyi79icxRGwfo6kA2LxY1tQi/SS/NqUM9r2zwyfjC1+VnQt1upTVtwPS2j3sFiE
 da50s6nA8nlF2gvplsHGsO6rEYdlu8TpPtrmUZMk3/YWrQ2/acin0sM2N5Cvl8EgERq4
 7R6vijcqk03PL4J/VGy+xN08IAdRCMVO6HU0tS6jp17EYe+3zvfpcub4eSXP0KhD7eTI
 KD+A==
X-Gm-Message-State: AOAM53041RXL3hzD6ipLgvXqU2pDX4zoS2Gjqs/EqtQiW9FaO5GjN0Jl
 qAl/oIx6kDP8fH2xvzJmxJ2kKwWx/O0eNQJdP7K5CMkbhorLfrlBCHV1M7IQYNScmxvxs8piiaj
 Z3R4tSOxrXQEAwpQ=
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr2302034wmc.98.1610545305138;
 Wed, 13 Jan 2021 05:41:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyE6t/aF/4MSX026mX46uuHdgSWe89d4XBvscsKHnxeTwOsZbq3uqsMByBYP/vmBPqyqEueA==
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr2302016wmc.98.1610545304948;
 Wed, 13 Jan 2021 05:41:44 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id n11sm3839020wra.9.2021.01.13.05.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:41:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 04/11] hw/ssi: imx_spi: Reduce 'change_mask'
 variable scope
In-Reply-To: <20210112183529.2011863-5-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:22
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-5-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:41:43 +0100
Message-ID: <87im81gdig.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I think this one is wrong.


> ---
>  hw/ssi/imx_spi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 35ab33c0511..bcc535f2893 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -303,7 +303,6 @@ static void imx_spi_write(void *opaque, hwaddr offset=
, uint64_t value,
>  {
>      IMXSPIState *s =3D opaque;
>      uint32_t index =3D offset >> 2;
> -    uint32_t change_mask;
> =20
>      if (index >=3D  ECSPI_MAX) {
>          qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0=
x%"
> @@ -313,7 +312,6 @@ static void imx_spi_write(void *opaque, hwaddr offset=
, uint64_t value,
> =20
>      trace_imx_spi_write(index, imx_spi_reg_name(index), value);
> =20
> -    change_mask =3D s->regs[index] ^ value;
> =20
>      switch (index) {
>      case ECSPI_RXDATA:
> @@ -357,6 +355,7 @@ static void imx_spi_write(void *opaque, hwaddr offset=
, uint64_t value,
>          }
> =20
>          if (imx_spi_channel_is_master(s)) {
> +            uint32_t change_mask =3D s->regs[index] ^ value;
>              int i;
> =20
>              /* We are in master mode */

The code does:

    change_mask =3D s->regs[index] ^ value;

    switch (index) {

    ...

    case ECSPI_CONREG:
        s->regs[ECSPI_CONREG] =3D value;  <<---- here

        if (!imx_spi_is_enabled(s)) {
            /* device is disabled, so this is a reset */
            imx_spi_reset(DEVICE(s));
            return;
        }

        if (imx_spi_channel_is_master(s)) {
            int i;
       >>>>>  You are setting change_mask here.

At this point, s->regs[index] has a new value in "here".

Later, Juan.


