Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CA42C57D1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:06:29 +0100 (CET)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiIqp-00073I-Lb
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiIpD-0006Mw-6q; Thu, 26 Nov 2020 10:04:47 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:32900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiIp5-0003UE-DV; Thu, 26 Nov 2020 10:04:46 -0500
Received: by mail-ot1-x343.google.com with SMTP id n12so2138729otk.0;
 Thu, 26 Nov 2020 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bdpOYV0pQGg0QXl5yS/Yo3PAPEnYrT9xE899f0g9oJk=;
 b=RRQTY7E99JpgNoChTi+Tqv4fD/a1e48NtiEOo9VLRPS6vfFl29F+ri4+TsJmKCSVSZ
 BqbxmHDizDcnlG5T49c3MIP24hQF5B90pT+e4zqaNrlMPjRgXIE0rYURRIWo6CctUF1K
 QPrFP/hKUhDfRXK+WqpCHran0uEOwcmw+19tTO76qI8qEhOkxDdf0bm7z/GtBG/VNKhz
 pT7trxCV8dpLnKtJoBDHwx4Gmv8M7YQOrpy2TwNUSOoNBweof8MSnN2WknoLkrofuPJ8
 NGBzsUmA1k6oNbDQRsYmp1OUCuim4bb0FwOPyuuHTD7K9GkE8vB5QBK+otG0vPsi7Xlk
 fYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bdpOYV0pQGg0QXl5yS/Yo3PAPEnYrT9xE899f0g9oJk=;
 b=t1qHu1nYYgH2FoByir2PQiJXHJwngDEq4ruM1kZsS9NlxwSikbaC/EXbcwpqFp4g7t
 MGA5s65R5RLnvw6XVQPMkgTYm4szDX76Au+hl3PZVASSKgNVHTLqb4flamCsRl9PCZpZ
 nae8iW3k/XonyZ38mZXTYTGudBgDLDyJLapJSC0VzQDl1ztIjB4S0Hxo5WInJOHqvwbD
 MKVeafiVsrTJzuq9ygItomkhgCN0aaOveUFR3+A34hXPqzs746KrLZ7ZPbYiBrXG/+aj
 Mo2XZXBzxnzWN4wdXDHdcdFbzLGgEdOBcZ1fKRZviSdRBdXJQJtJSywHo5D3VOqy7EuC
 oprQ==
X-Gm-Message-State: AOAM533owJRY5QEQ7mKtORe95GMPTkfumasMW26h2fDpB1+bVddhfhUn
 FfZD57wej5F2EJqGjsJDgP8NpGDx16fbcjtF2L4=
X-Google-Smtp-Source: ABdhPJyMQKvzorpTxpDjDEpxS8Q8D0JOB5fq0Mtic0P6Z5B/y9bLaa4Jq19IJATdCtm+cE/PiUkNYFpKpn1kfNlRSj4=
X-Received: by 2002:a9d:2643:: with SMTP id a61mr2538454otb.353.1606403076497; 
 Thu, 26 Nov 2020 07:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20201126101624.55714-1-alex.chen@huawei.com>
 <CAKXe6SLTqMgANNox-Y9=DhZHzRRaqT6taWBu1qenC4hsRe0+Qg@mail.gmail.com>
 <5FBF9413.4050907@huawei.com>
In-Reply-To: <5FBF9413.4050907@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 26 Nov 2020 23:04:00 +0800
Message-ID: <CAKXe6S+ZfGy44Od2_1MUK-eU9T6nWK0P-FGVR=uZc1dum1tKKA@mail.gmail.com>
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 qemu_oss@crudebyte.com, Greg Kurz <groug@kaod.org>,
 Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Chen <alex.chen@huawei.com> =E4=BA=8E2020=E5=B9=B411=E6=9C=8826=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:40=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2020/11/26 18:50, Li Qiang wrote:
> > Alex Chen <alex.chen@huawei.com>
> >>
> >> Only one of the options -s and -f can be used. When -f is used,
> >> the fd is created externally and does not need to be closed.
> >> When -s is used, a new socket fd is created, and this socket fd
> >> needs to be closed at the end of main().
> >>
> >> Reported-by: Euler Robot <euler.robot@huawei.com>
> >> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> >> ---
> >>  fsdev/virtfs-proxy-helper.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> >> index 15c0e79b06..339d477169 100644
> >> --- a/fsdev/virtfs-proxy-helper.c
> >> +++ b/fsdev/virtfs-proxy-helper.c
> >> @@ -1154,6 +1154,9 @@ int main(int argc, char **argv)
> >>      process_requests(sock);
> >>  error:
> >>      g_free(rpath);
> >> +    if (sock_name) {
> >> +        close(sock);
> >> +    }
> >
> > If 'proxy_socket' failed, you call close(-1).
> >
> > Maybe following is better?
> >
> > if (sock >=3D 0) {
> >     close(sock);
> > }
> >
>
> Hi Qiang,
>
> Thanks for your review.
> The 'sock' need to be closed only when option -s is used, that is when 's=
ock_name' is not NULL.
> So maybe the following is better?

Yes, you're right.


>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index 15c0e79b06..3ba68d9878 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -1154,6 +1154,9 @@ int main(int argc, char **argv)
>      process_requests(sock);
>  error:
>      g_free(rpath);
> +    if (sock_name && (sock >=3D 0)) {

No need parenthesis for 'sock>=3D0'?

Thanks,
Li Qiang

> +        close(sock);
> +    }
>      g_free(sock_name);
>      do_log(LOG_INFO, "Done\n");
>      closelog();
>
> Thanks,
> Alex
>

