Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E5C68EF05
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:35:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjfU-0005uu-Pe; Wed, 08 Feb 2023 07:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1pPjfK-0005uJ-9A
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1pPjfI-0002nG-6K
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675859706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hjy8VlTUhdW+AKg7deH3h0XYKN13BXTmzXiH/KqnIec=;
 b=D7pBCurPLZA2MZgQLIygOMuMNu62LfhqCaOaI9vk6G9ByQX9VoRJt7Sb9Zg52nNlBU7BiH
 UxzvuB/OMHd52yyT78HHLZBSvBDgu4MtpVG4pfv7kp6NLxXSTmWVHY7DgXZv0E/GQfZ0Rq
 pMCPnyzN0fUjpDDCCtFV752kzHCTkoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-iH4k7zlrPnWrslmKIVrq8Q-1; Wed, 08 Feb 2023 07:33:59 -0500
X-MC-Unique: iH4k7zlrPnWrslmKIVrq8Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2075C857A89;
 Wed,  8 Feb 2023 12:33:59 +0000 (UTC)
Received: from [10.40.195.48] (ovpn-195-48.brq.redhat.com [10.40.195.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89567492C3F;
 Wed,  8 Feb 2023 12:33:56 +0000 (UTC)
Message-ID: <479482bd-426c-fee7-da03-d286a1b359ee@redhat.com>
Date: Wed, 8 Feb 2023 13:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] virtio-blk: add missing AioContext lock
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20230208111148.1040083-1-eesposit@redhat.com>
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Autocrypt: addr=ldoktor@redhat.com; keydata=
 xsBNBFcV6vsBCADa8NUYov+a+AmCEEUB3stiiMM0NQc1WwlcxGoMxKHcqqIj/kdPhUDvFS32
 V94V7en1Lx+cpXKRMZP3n+3WG+VZWLwaktJgqrECZ161zE7xF5d1H3CLmwStbe6Cw1oR4LYQ
 HBpuqFEA5znoLuTTsP1uXs9h1cYNzX7hmOTvPCLJfDJ1iv954FsgCGtoVvl4CoxaR3u2VNOs
 hXsTTVyJM6gDTsyqn0uvLOHGWGIGVhDkLV4hv6pSdiKrtQKWIUji3Z8x41MbZybmJxHkpOVz
 Jl3jnNE3CbiEq77Is9LMI4yTF2CESs3V4XMBLfZPLrQBC0gzjeRxwCnbdOZRwY5KI457ABEB
 AAHNK0x1a2FzIERva3RvciAoUmVkIEhhdCkgPGxkb2t0b3JAcmVkaGF0LmNvbT7CwJUEEwEI
 AD8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEF
 AmAzSoUFCQzmojUACgkQJrNi5H/PIsGM4Qf+OmO8PqPg28arBfxGSjdxb4744E1bnLESNudf
 8VY5/UEca0X65KW9L5vd6XUjusy2T4iyUcbZhCxYcHQLqP6y3AIyVfgJz91HEAt2thMFPfbj
 IhqVlyP0xEyvCNLk83M4PLN9IhugvSLce6R6cliETevP/m7RQSiP1o0fKu0uAUrEKWD9DZMF
 99BaI635YZOPHQwQlkWnFBEKpKLjkuKpn/QSkW34mkaByn6zLhF5QeIp/9FQVUZCeOy/zR0G
 s8ggfDyr4vJuDU4gI9NGZs6zycTflmFpA46P03LgmdRL/C6U7vbUB6B+v0YddYJoaarLUKpa
 L4dG8h/m8RdXNA33YM7ATQRXFer7AQgAw8JIK9pZUfZWNZirBIwOevkdZu1aLhgH84EfXw40
 ynMEFa1t/c0baOiuLNcVbdnHLGvUAQJ2oN/+rdGpEWITVSjDxFYf3JOnySZJhLnQgGMG4j3m
 dFZMubPG1GJEuubPAAB0huRfjQTvOvpIK03J2H5cMoug862OHOnT+mfonGruTkSO0PBq3wtf
 P+Z3gLCuEDkmEZSh4IKxs0CoLU4KxWRQHpoTOxcAiHzj8cm5qbu3Cb1KrXz8dEmYhCq2fpFf
 /h+GfEO8gU/ICJD8WQUHYcVK0bbiZskCcSOGtStjwq0QqitZMbcsPEset/2L3z44MLPuVApv
 c9wORs/3iT9BhwARAQABwsB8BBgBCAAmAhsMFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAmAz
 So0FCQzmojUACgkQJrNi5H/PIsFS9Qf/WZ31JQQnQQSbmtm7IOAHYC7kvlQy8mejWlgeDrPW
 h3zQIXxiarBpAnYGsHNVOWJ+sjdELYc9bvOcGwXSRRxURArOYfkUOk4KmNmqd6eIrOvnFfap
 Lh0xRNx+9y0gYqB9TH/JaCLMPnH+jRGM0ZisNEHyXhemEXlXPy4vniEvajr4VnvFzD6gExzD
 jUqIel42BOOyHuXjZQDMEWf2eULSTGHTWXGdV2XErdS1v4YI/DGvQQPB29UHmb2RsZhKtntq
 0yoxFD60HzSHlVeiLmG/hAHLDY3dBs/GW3RJAbOVttS31llstDtdMEHLn+P81M4dVYzt5mEE
 NPy43Lf+YxM9FQ==
In-Reply-To: <20230208111148.1040083-1-eesposit@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S7BIohhw3CP2kenF002uw2jn"
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S7BIohhw3CP2kenF002uw2jn
Content-Type: multipart/mixed; boundary="------------jtj4OfEZHwE8LaiwyynnSSXS";
 protected-headers="v1"
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Message-ID: <479482bd-426c-fee7-da03-d286a1b359ee@redhat.com>
Subject: Re: [PATCH] virtio-blk: add missing AioContext lock
References: <20230208111148.1040083-1-eesposit@redhat.com>
In-Reply-To: <20230208111148.1040083-1-eesposit@redhat.com>

--------------jtj4OfEZHwE8LaiwyynnSSXS
Content-Type: multipart/mixed; boundary="------------nvyh3cKXt1b0fzwY6ABj5g7u"

--------------nvyh3cKXt1b0fzwY6ABj5g7u
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dne 08. 02. 23 v 12:11 Emanuele Giuseppe Esposito napsal(a):
> virtio_blk_update_config() calls blk_get_geometry and blk_getlength,
> and both functions eventually end up calling bdrv_poll_co when not
> running in a coroutine:
> - blk_getlength is a co_wrapper_mixed function
> - blk_get_geometry calls bdrv_get_geometry -> bdrv_nb_sectors, a
>   co_wrapper_mixed function too
>=20
> Since we are not running in a coroutine, we need to take s->blk
> AioContext lock, otherwise bdrv_poll_co will inevitably call
> AIO_WAIT_WHILE and therefore try to un unlock() an AioContext lock
> that was never acquired.
>=20
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D2167838
>=20
> Steps to reproduce the issue: simply boot a VM with
> -object '{"qom-type":"iothread","id":"iothread1"}' \
> -blockdev '{"driver":"file","filename":"$QCOW2","aio":"native","node-na=
me":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-re=
ad-only":true,"discard":"unmap"}' \
> -blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"=
direct":true,"no-flush":false},"driver":"qcow2","file":"libvirt-1-storage=
"}' \
> -device virtio-blk-pci,iothread=3Diothread1,drive=3Dlibvirt-1-format,id=
=3Dvirtio-disk0,bootindex=3D1,write-cache=3Don
>=20
> and observe that it will fail not manage to boot with "qemu_mutex_unloc=
k_impl: Operation not permitted"
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  hw/block/virtio-blk.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 1762517878..cefca93b31 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -894,6 +894,10 @@ static void virtio_blk_update_config(VirtIODevice =
*vdev, uint8_t *config)
>      uint64_t capacity;
>      int64_t length;
>      int blk_size =3D conf->logical_block_size;
> +    AioContext *ctx;
> +
> +    ctx =3D blk_get_aio_context(s->blk);
> +    aio_context_acquire(ctx);
> =20
>      blk_get_geometry(s->blk, &capacity);
>      memset(&blkcfg, 0, sizeof(blkcfg));
> @@ -917,6 +921,7 @@ static void virtio_blk_update_config(VirtIODevice *=
vdev, uint8_t *config)
>       * per track (cylinder).
>       */
>      length =3D blk_getlength(s->blk);
> +    aio_context_release(ctx);
>      if (length > 0 && length / conf->heads / conf->secs % blk_size) {
>          blkcfg.geometry.sectors =3D conf->secs & ~s->sector_mask;
>      } else {


Thanks, I can't talk about the correctness of the code but function-wise =
it addresses the issue.

Tested-by: Luk=C3=A1=C5=A1 Doktor <ldoktor@redhat.com>
--------------nvyh3cKXt1b0fzwY6ABj5g7u
Content-Type: application/pgp-keys; name="OpenPGP_0x26B362E47FCF22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0x26B362E47FCF22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFcV6vsBCADa8NUYov+a+AmCEEUB3stiiMM0NQc1WwlcxGoMxKHcqqIj/kdP
hUDvFS32V94V7en1Lx+cpXKRMZP3n+3WG+VZWLwaktJgqrECZ161zE7xF5d1H3CL
mwStbe6Cw1oR4LYQHBpuqFEA5znoLuTTsP1uXs9h1cYNzX7hmOTvPCLJfDJ1iv95
4FsgCGtoVvl4CoxaR3u2VNOshXsTTVyJM6gDTsyqn0uvLOHGWGIGVhDkLV4hv6pS
diKrtQKWIUji3Z8x41MbZybmJxHkpOVzJl3jnNE3CbiEq77Is9LMI4yTF2CESs3V
4XMBLfZPLrQBC0gzjeRxwCnbdOZRwY5KI457ABEBAAHNK0x1a2FzIERva3RvciAo
UmVkIEhhdCkgPGxkb2t0b3JAcmVkaGF0LmNvbT7CwJUEEwEIAD8CGwMGCwkIBwMC
BhUIAgkKCwQWAgMBAh4BAheAFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAmAzSoUF
CQzmojUACgkQJrNi5H/PIsGM4Qf+OmO8PqPg28arBfxGSjdxb4744E1bnLESNudf
8VY5/UEca0X65KW9L5vd6XUjusy2T4iyUcbZhCxYcHQLqP6y3AIyVfgJz91HEAt2
thMFPfbjIhqVlyP0xEyvCNLk83M4PLN9IhugvSLce6R6cliETevP/m7RQSiP1o0f
Ku0uAUrEKWD9DZMF99BaI635YZOPHQwQlkWnFBEKpKLjkuKpn/QSkW34mkaByn6z
LhF5QeIp/9FQVUZCeOy/zR0Gs8ggfDyr4vJuDU4gI9NGZs6zycTflmFpA46P03Lg
mdRL/C6U7vbUB6B+v0YddYJoaarLUKpaL4dG8h/m8RdXNA33YMLAfgQTAQIAKAUC
VxXq+wIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQJrNi5H/P
IsHTywf+Nw03Y2XAryQ/CbTGa1BhsVtEo8Vwao+3/G4GwfOp93PNB24s7GDbiOZQ
jtwm7nZ45u0eQtx3AasN5/Z2ZSGRXsHv6AgM6qbcAR8SAiY1lodAdThBL7nVJgMp
JbVtfBHSTa8q5+ubeEoLLmktXljoME6l2ueAQcZvYDCfrqXbukTvxecVg07Hg+V+
rRwuGKxeUN+SvOp1NiJTj4HzzAUiFJWXmrsDrhaMqkahopAyhq86zsvmh1UBjNKS
y3w/aQb9QvTJ/qEWIG2D/iHjgujei/aTXsB5qIOlCk5Tdsj1ZjGHg+zaDaVo+MOc
KYfDpyQxYGQ4eFW0ijdWgZfbTG8fKcLAlQQTAQIAPwIbAwYLCQgHAwIGFQgCCQoL
BBYCAwECHgECF4AWIQSkCkxFxANN4Cpa1IMms2Lkf88iwQUCWpWOrQUJB0IKsgAK
CRAms2Lkf88iwUXVB/4rbeQHmI6+xt7+zBB1r2cllKAqRtcsIXcoJ3CMJjep2d4f
Oujr3qqixGFaf62ktDoynyyCde4mT3qpqm1e3HRHUKLagcWjTVZ9xItnV/33/Sp1
YZYmFO3ZM80/oDmuvD/8VmVA5g1Ngb2+ft64sTR6XfZlCn/QcI7tekuK6MRfjx9Z
2Vo+YM6dqUkSnPMkk27xaccgbZ4tLyUas12c9uTEfJ4RHE+5YMCYeZbJlJoMy0x3
jRdUp8t+TJjzePP66ry4zE8zOrXXpi8XKCxeok+BYZhff0F1qwSyyv8YAEeqApjn
h21N0ycVlkVWjCSgJKHYCX9f85KTnCnJhmsRh4o0wsCUBBMBCAA/AhsDBgsJCAcD
AgYVCAIJCgsEFgIDAQIeAQIXgBYhBKQKTEXEA03gKlrUgyazYuR/zyLBBQJeHGos
BQkLBW61AAoJECazYuR/zyLBK1gH9jnk79ikqObpIpHUgP4jSLQ16qjIYKzdCWzG
nW/NlWCighT/jV0MtujUKnCo2iZZr9UOK2A3y78/tYL54q+pfYIOO4PxDwubNlMR
jpRs/H84B3B53tNjxRFCgjUpUmUyVvAwsBSjeFZDxqrp4Cbw3fYvIAvQf0wdxx+C
B6/NpgNwZ0N8JpfShyl0aBCVUdeXHepClOeTERtJqulc2J1uVsMsX9GQuvkdrUIM
8bL8UVT70F0m3Br95FqD4EaOWvCFszAdfeLVlWDWqoTFDymbIAVBhdyXc68IAwQL
gtepioMjA68x919GWd01x/pkAV7v6ceS/ATM/1gIm5Iz1U3qntHPAc7/ARAAAQEA
AAAAAAAAAAAAAAD/2P/gABBKRklGAAEBAAABAAEAAP/bAEMACAYGBwYFCAcHBwkJ
CAoMFA0MCwsMGRITDxQdGh8eHRocHCAkLicgIiwjHBwoNyksMDE0NDQfJzk9ODI8
LjM0Mv/bAEMBCQkJDAsMGA0NGDIhHCEyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy
MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMv/AABEIAJIAewMBIgACEQEDEQH/xAAf
AAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAA
AX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUm
JygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaH
iImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna
4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUG
BwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgU
QpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVW
V1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqy
s7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAM
AwEAAhEDEQA/APSipJ/xpMHPJ4qQke9M+UHof1roMxNvPBoKEjtS5G7PzU8MvqwN
IZWaL5u/4CoXgUHeScVfOw9CRXKeJPFMGnu9vbsslyOCR0T/AOvUTqKCuyowcnZG
rNLDCCXcqo6+1R/25pNnAWN3AGOTjeK8k1XWbi9kJuZ5G9E3H/IrFM7b/T6GuZ1p
S2N1R5d2evz6/pNzZFBfR71+6N2OaqWmpQiGVFulZz0CvmvK1mfkqW9yTgCoPPkD
s/nMWHTbUaj5Ue+RXJMMLDPKAGni4wWJPJFeRaL4zv8ATkVHkM8KjLRyc4Hseor0
fQ9Utdes2ni3xOuAyMQcd+vetYu+hk1Yp3Ux/tG4PrJSRSgM2Over0ugNJKztdkl
zkYUVGNBkV+JhsJ5OcH+VP2bDmQ3z8qMnk1AZSDjJq//AGPHnAn3Y9DUL6QNxwrn
3zS9m2HOjrSM9qb5ZPJA/KpDz0BFNKgnpk11mIDAHIIpCw7UuwnoKrX9yLGwnuGG
fLQtj1NJuyuNK7sYfirxImlWxt4XH2px2P3B615PdXwdmcvudjnJPema7fT3VzK0
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
5mEENPy43Lf+YxM9FQ=3D=3D
=3DPgBW
-----END PGP PUBLIC KEY BLOCK-----

--------------nvyh3cKXt1b0fzwY6ABj5g7u--

--------------jtj4OfEZHwE8LaiwyynnSSXS--

--------------S7BIohhw3CP2kenF002uw2jn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAmPjlrIFAwAAAAAACgkQJrNi5H/PIsEm
vQf9FrQ0ScHtL4igplydW9pxWaSvTBQPa0ndh+eye6JQqIVvaYgyeW8ZzwHR0gTeyms5hMlxre7w
t047ut0zegd71L5vZ/jBEz+3Avv/Lx0brO7vS/OVvciId+qnmjvrfMOw95zYJnyzRLR2PGk0a66v
YXMVDdnHxaEQPGcwCtcp89T6nKWsTMmXyzIPN+18nbBBQ26KOFraioOHyALO+Pc3t3tKIyqsMiw1
xolqESilPrinoGpPUDh2HKQX3NOLxB3PpqNNeBxjIHw3LTdQF7NxS4TsKysf9mtXgWLcqoQsn98c
hT8ppZnLHi3YwOxa2j6alEOSEtLdrY5g0RO/880Rfw==
=wv0V
-----END PGP SIGNATURE-----

--------------S7BIohhw3CP2kenF002uw2jn--


