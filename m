Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF273B7E5B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 09:50:25 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyUzI-00022A-Dq
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 03:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyUyM-0001EQ-Tn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 03:49:26 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyUyK-00043w-SZ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 03:49:26 -0400
Received: by mail-ed1-x535.google.com with SMTP id df12so1915587edb.2
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdPm33gmv2LW80ZQbMlL1i/5TscHMpwFvDkzoLn+7Ac=;
 b=kUmztwLbfzPexT10ZlCfDPt6vXdmjo1J9Wv6DSSSt6ppqhaBbCc3lz7CHAOAkaxpTD
 uBBt89B7pD0YEGIaJg+8Meorb7lasFpnC+MJO9/aVaaXEOq52yZSwuVFA2TEVfpZoyJL
 jDecTXVcUtM4iVFJ0as0M2nVhQ67SZ5Qn7Y0L+Vfm5lSajw/ZRzfCEOZHxZG565qSxcX
 rZzCEHd6mQ0l1qc/KDKuBtIl9POEkLmZFu3E5puT1JVKFmUlHk3U/+/Xqmio6tXOyOZo
 0VL4o0wxEfEbqNbg0ntYbqBA1+GmOs8nEz8d/mrb8CbeFBuhPMjgW+5/JbtgwSqIwPho
 wdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdPm33gmv2LW80ZQbMlL1i/5TscHMpwFvDkzoLn+7Ac=;
 b=IEPmpK2eVFCrGTJU1TdbajEcQTP375lIBcvZvEU9HbngmgogFtq2SlKzrYQgKe9UPJ
 gyqpFP8LdPFlvP0rhhGyVKkImzfZ1F2QFZcVrOWGS/qfJT1wSxia38mcUUbOuNxcT93G
 oJj7V9Iwu8QnTsCScbmet0qt9Sa5RFEV3ilDPz9LtNsmYYtq3JpUoP0KSfEcyso6qbeX
 Y71kY1WKCGjccCKe+ulu5fG/+kkHoIGmaSd7F+jtTzwfAzavxmuR05+eYtXkpJkUYvYG
 A+LWi/i7/Ekp/Ieii1UHRvDz/afs5CYguBvAATrFCH+jIgqcYMhcelKul0PCBaBuLPEe
 5kUw==
X-Gm-Message-State: AOAM531LXmb62cFOavo2Fd1iQXr4xROVwu+HSHPQ0/Flcz0HptD4mN8c
 VdbS5p+J2WAXdmKPxE0VwSYXi/LgVAF2NpCRUGE=
X-Google-Smtp-Source: ABdhPJwf6kBRYekkguDBXgohAkN7bkjhi3F4QCSnMs91nbRkUrJ09WVnO6dbaupgLkOJKv7Ryu7o7ZhYy2/SIh/JVio=
X-Received: by 2002:a05:6402:1d11:: with SMTP id
 dg17mr46129022edb.30.1625039362710; 
 Wed, 30 Jun 2021 00:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <1625067199-64288-1-git-send-email-wang.yi59@zte.com.cn>
In-Reply-To: <1625067199-64288-1-git-send-email-wang.yi59@zte.com.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 30 Jun 2021 11:49:11 +0400
Message-ID: <CAJ+F1CLZfsKeP_nYizavJbBvKCQhE-ywK9LOUKygh6OAbjAQWw@mail.gmail.com>
Subject: Re: [PATCH] qga: fix a memory leak in qmp_guest_exec_status()
To: Yi Wang <wang.yi59@zte.com.cn>
Content-Type: multipart/alternative; boundary="000000000000f5e09705c5f6f5f2"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xue.zhihong@zte.com.cn, Wang Yechao <wang.yechao255@zte.com.cn>,
 QEMU <qemu-devel@nongnu.org>, wang.liang82@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f5e09705c5f6f5f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 30, 2021 at 11:42 AM Yi Wang <wang.yi59@zte.com.cn> wrote:

> From: Wang Yechao <wang.yechao255@zte.com.cn>
>
> The $GuestExecInfo.out.data is alloced in guest_exec_output_watch(),
> and the buffer size is $GuestExecInfo.out.size. We should free the
> $GuestExecInfo.out.data judge by the size, not length. Because the
> $GuestExecInfo.out.length maybe zero in some case.
>
> $GuestExecInfo.err.data has the same problem.
>
> Signed-off-by: Yechao Wang <wang.yechao255@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> ---
>  qga/commands.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands.c b/qga/commands.c
> index d3fec80..58d4da9 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
>
> @@ -214,17 +214,21 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid,=
 Error **errp)
>          if (gei->out.length > 0) {
>              ges->has_out_data =3D true;
>
>              ges->out_data =3D g_base64_encode(gei->out.data, gei->out.le=
ngth);
> -            g_free(gei->out.data);
>              ges->has_out_truncated =3D gei->out.truncated;
>          }
>
>          if (gei->err.length > 0) {
>              ges->has_err_data =3D true;
>
>              ges->err_data =3D g_base64_encode(gei->err.data, gei->err.le=
ngth);
> -            g_free(gei->err.data);
>              ges->has_err_truncated =3D gei->err.truncated;
>          }
>
> +        if (gei->out.size > 0)
> +            g_free(gei->out.data);
> +
> +        if (gei->err.size > 0)
> +             g_free(gei->err.data);
>

You shouldn't need to check if size > 0. You can just call g_free() on the
fields (NULL is ignored).

Looks good otherwise

+
>          QTAILQ_REMOVE(&guest_exec_state.processes, gei, next);
>          g_free(gei);
>      }
> --
> 1.8.3.1
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000f5e09705c5f6f5f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGk8YnI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBK
dW4gMzAsIDIwMjEgYXQgMTE6NDIgQU0gWWkgV2FuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndhbmcu
eWk1OUB6dGUuY29tLmNuIj53YW5nLnlpNTlAenRlLmNvbS5jbjwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+RnJvbTrCoFdhbmfCoFllY2hhb8KgJmx0OzxhIGhyZWY9Im1haWx0bzp3YW5n
LnllY2hhbzI1NUB6dGUuY29tLmNuIiB0YXJnZXQ9Il9ibGFuayI+d2FuZy55ZWNoYW8yNTVAenRl
LmNvbS5jbjwvYT4mZ3Q7DQo8YnI+DQo8YnI+VGhlwqAkR3Vlc3RFeGVjSW5mby5vdXQuZGF0YcKg
aXPCoGFsbG9jZWTCoGluwqBndWVzdF9leGVjX291dHB1dF93YXRjaCgpLDxicj5hbmTCoHRoZcKg
YnVmZmVywqBzaXplwqBpc8KgJEd1ZXN0RXhlY0luZm8ub3V0LnNpemUuwqBXZcKgc2hvdWxkwqBm
cmVlwqB0aGU8YnI+JEd1ZXN0RXhlY0luZm8ub3V0LmRhdGHCoGp1ZGdlwqBiecKgdGhlwqBzaXpl
LMKgbm90wqBsZW5ndGguwqBCZWNhdXNlwqB0aGU8YnI+JEd1ZXN0RXhlY0luZm8ub3V0Lmxlbmd0
aMKgbWF5YmXCoHplcm/CoGluwqBzb21lwqBjYXNlLjxicj4NCjxicj4kR3Vlc3RFeGVjSW5mby5l
cnIuZGF0YcKgaGFzwqB0aGXCoHNhbWXCoHByb2JsZW0uPGJyPg0KPGJyPlNpZ25lZC1vZmYtYnk6
wqBZZWNoYW/CoFdhbmfCoCZsdDs8YSBocmVmPSJtYWlsdG86d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbiIgdGFyZ2V0PSJfYmxhbmsiPndhbmcueWVjaGFvMjU1QHp0ZS5jb20uY248L2E+Jmd0Ow0K
PGJyPlNpZ25lZC1vZmYtYnk6wqBZacKgV2FuZ8KgJmx0OzxhIGhyZWY9Im1haWx0bzp3YW5nLnlp
NTlAenRlLmNvbS5jbiIgdGFyZ2V0PSJfYmxhbmsiPndhbmcueWk1OUB6dGUuY29tLmNuPC9hPiZn
dDsNCjxicj4tLS08YnI+wqBxZ2EvY29tbWFuZHMuY8KgfMKgOMKgKysrKysrLS08YnI+wqAxwqBm
aWxlwqBjaGFuZ2VkLMKgNsKgaW5zZXJ0aW9ucygrKSzCoDLCoGRlbGV0aW9ucygtKTxicj4NCjxi
cj5kaWZmwqAtLWdpdMKgYS9xZ2EvY29tbWFuZHMuY8KgYi9xZ2EvY29tbWFuZHMuYzxicj5pbmRl
eMKgZDNmZWM4MC4uNThkNGRhOcKgMTAwNjQ0PGJyPi0tLcKgYS9xZ2EvY29tbWFuZHMuYzxicj4r
KyvCoGIvcWdhL2NvbW1hbmRzLmM8YnI+QEDCoC0yMTQsMTfCoCsyMTQsMjHCoEBAwqBHdWVzdEV4
ZWNTdGF0dXPCoCpxbXBfZ3Vlc3RfZXhlY19zdGF0dXMoaW50NjRfdMKgcGlkLMKgRXJyb3LCoCoq
ZXJycCk8YnI+wqDCoMKgwqDCoMKgwqDCoMKgaWbCoChnZWktJmd0O291dC5sZW5ndGjCoCZndDvC
oDApwqB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ2VzLSZndDtoYXNfb3V0X2RhdGHC
oD3CoHRydWU7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ2VzLSZndDtvdXRfZGF0YcKg
PcKgZ19iYXNlNjRfZW5jb2RlKGdlaS0mZ3Q7b3V0LmRhdGEswqBnZWktJmd0O291dC5sZW5ndGgp
Ozxicj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ19mcmVlKGdlaS0mZ3Q7b3V0LmRhdGEpOzxi
cj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdlcy0mZ3Q7aGFzX291dF90cnVuY2F0ZWTCoD3C
oGdlaS0mZ3Q7b3V0LnRydW5jYXRlZDs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgfTxicj7CoA0KPGJy
PsKgwqDCoMKgwqDCoMKgwqDCoGlmwqAoZ2VpLSZndDtlcnIubGVuZ3RowqAmZ3Q7wqAwKcKgezxi
cj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdlcy0mZ3Q7aGFzX2Vycl9kYXRhwqA9wqB0cnVl
Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdlcy0mZ3Q7ZXJyX2RhdGHCoD3CoGdfYmFz
ZTY0X2VuY29kZShnZWktJmd0O2Vyci5kYXRhLMKgZ2VpLSZndDtlcnIubGVuZ3RoKTs8YnI+LcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdfZnJlZShnZWktJmd0O2Vyci5kYXRhKTs8YnI+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBnZXMtJmd0O2hhc19lcnJfdHJ1bmNhdGVkwqA9wqBnZWktJmd0
O2Vyci50cnVuY2F0ZWQ7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoH08YnI+wqANCjxicj4rwqDCoMKg
wqDCoMKgwqDCoGlmwqAoZ2VpLSZndDtvdXQuc2l6ZcKgJmd0O8KgMCk8YnI+K8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGdfZnJlZShnZWktJmd0O291dC5kYXRhKTs8YnI+Kzxicj4rwqDCoMKgwqDC
oMKgwqDCoGlmwqAoZ2VpLSZndDtlcnIuc2l6ZcKgJmd0O8KgMCk8YnI+K8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ19mcmVlKGdlaS0mZ3Q7ZXJyLmRhdGEpOzxicj48L2Jsb2NrcXVvdGU+PGRp
dj48YnI+PC9kaXY+PGRpdj5Zb3Ugc2hvdWxkbiYjMzk7dCBuZWVkIHRvIGNoZWNrIGlmIHNpemUg
Jmd0OyAwLiBZb3UgY2FuIGp1c3QgY2FsbCBnX2ZyZWUoKSBvbiB0aGUgZmllbGRzIChOVUxMIGlz
IGlnbm9yZWQpLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+TG9va3MgZ29vZCBvdGhlcndpc2U8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Kzxicj7CoMKgwqDCoMKgwqDCoMKgwqBRVEFJTFFf
UkVNT1ZFKCZhbXA7Z3Vlc3RfZXhlY19zdGF0ZS5wcm9jZXNzZXMswqBnZWkswqBuZXh0KTs8YnI+
wqDCoMKgwqDCoMKgwqDCoMKgZ19mcmVlKGdlaSk7PGJyPsKgwqDCoMKgwqB9PGJyPi0twqANCjxi
cj4xLjguMy4xPGJyPjwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxi
cj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj5NYXJjLUFuZHLDqSBMdXJl
YXU8YnI+PC9kaXY+PC9kaXY+DQo=
--000000000000f5e09705c5f6f5f2--

