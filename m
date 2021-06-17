Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386163ABFAA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:44:39 +0200 (CEST)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1gb-0001vL-Vy
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1fa-0001FP-K7
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 19:43:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:16978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1fX-0001rZ-DM
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 19:43:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 327BF7457EF;
 Fri, 18 Jun 2021 01:43:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E11FD7457E5; Fri, 18 Jun 2021 01:43:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DF5B17456B4;
 Fri, 18 Jun 2021 01:43:27 +0200 (CEST)
Date: Fri, 18 Jun 2021 01:43:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 04/15] hw/display/sm501: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <20210617115334.2761573-5-f4bug@amsat.org>
Message-ID: <e3912ff6-b429-55c0-ad73-ab17e4572dc6@eik.bme.hu>
References: <20210617115334.2761573-1-f4bug@amsat.org>
 <20210617115334.2761573-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1165346883-1623973407=:59666"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1165346883-1623973407=:59666
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 17 Jun 2021, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easier to review.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index f276276f7f1..569661a0746 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1033,17 +1033,18 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
>     case SM501_I2C_CONTROL:
>         if (value & SM501_I2C_CONTROL_ENABLE) {
>             if (value & SM501_I2C_CONTROL_START) {
> +                bool is_recv = s->i2c_addr & 1;
>                 int res = i2c_start_transfer(s->i2c_bus,
>                                              s->i2c_addr >> 1,
> -                                             s->i2c_addr & 1);
> +                                             is_recv);
>                 if (res) {
>                     s->i2c_status |= SM501_I2C_STATUS_ERROR;
>                 } else {
>                     int i;
>                     for (i = 0; i <= s->i2c_byte_count; i++) {
> -                        res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
> -                                            !(s->i2c_addr & 1));
> -                        if (res) {
> +                        if (is_recv) {
> +                            s->i2c_data[i] = i2c_recv(s->i2c_bus);
> +                        } else if (i2c_send(s->i2c_bus, s->i2c_data[i]) < 0) {
>                             s->i2c_status |= SM501_I2C_STATUS_ERROR;
>                             return;
>                         }
>
--3866299591-1165346883-1623973407=:59666--

