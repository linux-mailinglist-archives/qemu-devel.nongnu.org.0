Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E910EC4E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 16:29:49 +0100 (CET)
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibndz-0006R4-LN
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 10:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1ibnZn-0004oB-MF
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:25:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1ibnZm-0001DN-C5
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:25:27 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:58282)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1ibnZl-0001CW-Sj
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:25:26 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7F6F896EF0;
 Mon,  2 Dec 2019 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1575300323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aeO8O8KhQQaq5X4MYaBmu9UJye5UuaXRanZt/dtU5U=;
 b=jyCgI2KQ/VvR3p6qQXuChLhIcfDWGokOfDlYL/roxfeNjsBBIauUjMVaR2dQ7zJUb7Uq0I
 MD+XkehThOyzy9AkaFL0NYpVgscJpZSMlXn05twwavFeILzouqp4yYz649AXIuTJTs0DoV
 e43NMziC3awSA3GouxrfbRqcSwAKJmo=
Subject: Re: [PATCH v2 02/14] gdbstub: stop passing GDBState * around and use
 global
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-3-alex.bennee@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <5b13ffc4-9097-98ec-abe3-214f4303b708@greensocs.com>
Date: Mon, 2 Dec 2019 16:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1575300323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aeO8O8KhQQaq5X4MYaBmu9UJye5UuaXRanZt/dtU5U=;
 b=cw7gTCl8mak3PDO5lPy8CZ1U0791DVQfXj/ltBtFrOOOIVXnA8TLg3YglMDoGdMCesMXrx
 YjX4pJzgmlOGUgAUl+rURE4XxW6no2E5/tkP3eSnr5V7Cfn78QMmDszQakBggUGFTskdoN
 VbRLAH1JeJ4lkTrZ/fk7E5K/qgFtDVA=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1575300323; a=rsa-sha256; cv=none;
 b=ntXr5zRChPBYnnIP+pwkbn06RufzrCGhJwUnLXOvj+u6xxK7jq2jqncDb8YaHDhrtXbdqs
 EOXYhzHZ9VOlJz3MNrzxGEGvzuBYhZOOeYcsXqgcMrQZZopSgqD05VrerstRJOxhy+xu/6
 hW9iG6WYvWFBJIaHVizD6mYHAAC4neQ=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: luis.machado@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/30/19 9:45 AM, Alex Benn=C3=A9e wrote:
> We only have one GDBState which should be allocated at the time we
> process any commands. This will make further clean-up a bit easier.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 539 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 267 insertions(+), 272 deletions(-)
>=20

> @@ -2919,33 +2914,33 @@ static void gdb_read_byte(GDBState *s, uint8_t =
ch)> [...]
>              } else {
>                  /* send ACK reply */
>                  reply =3D '+';
> -                put_buffer(s, &reply, 1);
> -                s->state =3D gdb_handle_packet(s, s->line_buf);
> +                put_buffer(&reply, 1);
> +                gdbserver_state.state =3D gdb_handle_packet(s, gdbserv=
er_state.line_buf);

Is there a reason to keep the GDBState* first parameter in
gdb_handle_packet() ?

There is a few remaining functions still taking GDBState* parameter
+ gdb_handle_packet
+ run_cmd_parser
+ gdb_monitor_output
+ create_default_processes
+ create_processes
+ gdb_read_byte

We should probably clean them too, but otherwise it looks good.

--
Damien

