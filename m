Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D51801F0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 16:34:18 +0100 (CET)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBgtd-0007dk-QM
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 11:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jBgsR-0006id-3w
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 11:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jBgsP-00005R-Qf
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 11:33:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24186
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jBgsP-0008Vw-MJ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 11:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583854381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6ABJap80LElFuvEHfetuDSgrJ9axbWwyv1UXPUTJnWQ=;
 b=OpOnrc886SlRoh8RBPMoZm3AfzruFGS/gnutbra7b6ucb+0EC3SStg1bTwKccWMURg1glO
 Luldrf61+SoZM3P8INQcIB7y+DweRdFxgKKwcFzB/D/EawSavGZZVS3kmGcThGP5WZicN+
 pQHqhVgOQQruxwwJ5SQfy3um9NADVOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-h4uJaBcDNpybkeHBW88wbw-1; Tue, 10 Mar 2020 11:32:57 -0400
X-MC-Unique: h4uJaBcDNpybkeHBW88wbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F929107ACC4;
 Tue, 10 Mar 2020 15:32:56 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7776F60BF4;
 Tue, 10 Mar 2020 15:32:54 +0000 (UTC)
Subject: Re: [PATCH v3 8/9] block/block-copy: reduce intersecting request lock
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200306073831.7737-1-vsementsov@virtuozzo.com>
 <20200306073831.7737-9-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <d261061c-607b-d7a3-e43b-f436d46e4f0a@redhat.com>
Date: Tue, 10 Mar 2020 16:32:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306073831.7737-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zG4kBNkr5JTX3hUbLRUGMzabqXC8fwEm4"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zG4kBNkr5JTX3hUbLRUGMzabqXC8fwEm4
Content-Type: multipart/mixed; boundary="4cbhubXc3lC6FtfrjiEgZRREUwtNl9Hof"

--4cbhubXc3lC6FtfrjiEgZRREUwtNl9Hof
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06.03.20 08:38, Vladimir Sementsov-Ogievskiy wrote:
> Currently, block_copy operation lock the whole requested region. But
> there is no reason to lock clusters, which are already copied, it will
> disturb other parallel block_copy requests for no reason.
>=20
> Let's instead do the following:
>=20
> Lock only sub-region, which we are going to operate on. Then, after
> copying all dirty sub-regions, we should wait for intersecting
> requests block-copy, if they failed, we should retry these new dirty
> clusters.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> ---
>  block/block-copy.c | 128 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 104 insertions(+), 24 deletions(-)
>=20
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 2b29131653..d66b8eb691 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c

[...]

> +/* Called only on full-dirty region */
>  static void block_copy_inflight_req_begin(BlockCopyState *s,
>                                            BlockCopyInFlightReq *req,
>                                            int64_t offset, int64_t bytes)
>  {
> +    assert(!find_conflicting_inflight_req(s, offset, bytes));
> +
> +    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
> +    s->in_flight_bytes +=3D bytes;
> +
>      req->offset =3D offset;
>      req->bytes =3D bytes;
>      qemu_co_queue_init(&req->wait_queue);
>      QLIST_INSERT_HEAD(&s->inflight_reqs, req, list);
>  }
> =20
> -static void coroutine_fn block_copy_inflight_req_end(BlockCopyInFlightRe=
q *req)
> +/*
> + * block_copy_inflight_req_shrink
> + *
> + * Drop the tail of the request to be handled later. Set dirty bits back=
 and
> + * wake up all requests waiting for us (may be some of them are not inte=
rsecting
> + * with shrunk request)
> + */
> +static void coroutine_fn block_copy_inflight_req_shrink(BlockCopyState *=
s,
> +        BlockCopyInFlightReq *req, int64_t new_bytes)
>  {
> +    if (new_bytes =3D=3D req->bytes) {
> +        return;
> +    }
> +
> +    assert(new_bytes > 0 && new_bytes < req->bytes);
> +
> +    bdrv_set_dirty_bitmap(s->copy_bitmap,
> +                          req->offset + new_bytes, req->bytes - new_byte=
s);

I think we need to reduce in_flight_bytes here.

> +
> +    req->bytes =3D new_bytes;
> +    qemu_co_queue_restart_all(&req->wait_queue);
> +}
> +
> +static void coroutine_fn block_copy_inflight_req_end(BlockCopyState *s,
> +                                                     BlockCopyInFlightRe=
q *req,
> +                                                     int ret)
> +{
> +    s->in_flight_bytes -=3D req->bytes;
> +    if (ret < 0) {
> +        bdrv_set_dirty_bitmap(s->copy_bitmap, req->offset, req->bytes);
> +    }
>      QLIST_REMOVE(req, list);
>      qemu_co_queue_restart_all(&req->wait_queue);
>  }

[...]

> @@ -432,7 +479,40 @@ int coroutine_fn block_copy(BlockCopyState *s,
>          bytes -=3D cur_bytes;
>      }
> =20
> -    block_copy_inflight_req_end(&req);
> +    return found_dirty;
> +}
> +
> +/*
> + * block_copy
> + *
> + * Copy requested region, accordingly to dirty bitmap.
> + * Collaborate with parallel block_copy requests: if they success it hel=
p us. If

s/success/succeed/, s/it help/it will help/

> + * they fail, we retry not-copied regions. So, if we return error, it me=
ans that

s/retry/will retry/

(In theory also s/it means/it will mean/, but I suppose that also works
as-is.)

> + * io operation failed in context of _this_ block_copy call, not some pa=
rallel

Perhaps rather =93some I/O operation failed in the context of [=85]=94?

> + * operation.
> + */
> +int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t b=
ytes,
> +                            bool *error_is_read)
> +{
> +    int ret;
> +
> +    do {
> +        ret =3D block_copy_dirty_clusters(s, offset, bytes, error_is_rea=
d);
> +
> +        if (ret =3D=3D 0) {
> +            ret =3D block_copy_wait_one(s, offset, bytes);
> +        }
> +
> +        /*
> +         * We retry in two cases:
> +         * 1. Some progress done
> +         *    Something was copied, which means that there were yield po=
ints
> +         *    and some new dirty bits may have appeared (due to failed p=
arallel
> +         *    block-copy requests).
> +         * 2. We have waited for some intersecting block-copy request
> +         *    It may have failed and produced new dirty bits.
> +         */
> +    } while (ret > 0);
> =20
>      return ret;
>  }

This new code looks good.

Max


--4cbhubXc3lC6FtfrjiEgZRREUwtNl9Hof--

--zG4kBNkr5JTX3hUbLRUGMzabqXC8fwEm4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5nsyQACgkQ9AfbAGHV
z0DvIwf/SWGr56EFduk50TgC09hX8DIoAACCp0OqxIVujzK5I5neuABAcj05peUt
THG35UTrPK31o50agFrWqyPpB9So+D5FoEGAc9j7J16xDtPuVS6CYraSNrQk36GG
OBoK2rmWArcDeAzcS8pRJxlMTvePijF3dA03qhECWjd1qUy+p03Y81FW9A+LS6Ps
Pe82ls/lVKdPDe4jhNKx8PW4baJOv2jMrwHzREO38cs0exrQGzUEOcJBThtyNIbK
OQPcmrCS3uHRHZHxgHTnDN/7VEi4AAmjeE9FzDC4S+9OazHSQTddN/T1JJhoNeQT
/wCF0syJx0iSBwFW67EUOe3izrVeyQ==
=PxRS
-----END PGP SIGNATURE-----

--zG4kBNkr5JTX3hUbLRUGMzabqXC8fwEm4--


