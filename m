Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28C4D5F8C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:33:22 +0100 (CET)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nScaH-00040E-9Q
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:33:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nScZE-0003KK-2u
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:32:16 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nScZB-0003bD-UV
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3uJIokIAEq+L/VHMjkxxaZohUBukFCnBgHTHmRf7qX0=; b=biB7Z8e69pmQtDFFfW0aKeK128
 cYClDHDZIQCgDAgSrQAGHbTWhLqdGwblQuboywGG5XbHt/MoXDLg8ER59tAK6AiwKRcgNnOLjjPCB
 4L+EYK3lt5+xNyZ/OTDZLkG+89z2CeRLNYT3wTFZ1ry3mfiIJj5G61kZX63mTkj79ACGpi9E/WBGb
 v28aDboeqouaf812HQb41oJTV7SudviPRZFHYIcNVpHoHg2lrVzjn9XQ1P5qqqgRVfGNH1Wg0TpSw
 X4BAy8R/QHWg2KTwB4IrA3eAmpI1X8UQWC+aip5QvIFAHjsQxwUMLPivercZI0CtU6xMxvt/pQzgX
 +tWiqIux9aTX+mqseLjEiooMq2+d/SX3iMi5IsH+UfaY+eB4kz7o6sD8S4Q4tgkx75Fb1/dM4eh+6
 ru00rUJ5i24v65plWYW83ABUTT2FmSxt1HrrzkgZTrN2ylQQUC6KpKYGuuW6kQYQOqSflEtvaQiCZ
 Tb0s1DAkj4O3TUGDkAa4ZJktr7Dz8DH+bPGKSZY1vOuoY74Iy/CiDCXq2DWH8WYFFVUPJ1mbexy44
 yUGk2AhqHURjskPQW+olaRIhDTzngbr4qqKa8VkYF2SgWPEopbQW6wDYk1vWJMxmrri5vOt/qJNh7
 hFrcaGwnfXek8ETSDi1Ef3XUJ8K61ino3UkeqymNQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 6/6] tests/9pfs: guard recent 'Twalk' behaviour fix
Date: Fri, 11 Mar 2022 11:32:10 +0100
Message-ID: <11439213.03v0zW7vJB@silver>
In-Reply-To: <51e7f12fad3f36ce166e2f6e415784b13c4df5c4.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <51e7f12fad3f36ce166e2f6e415784b13c4df5c4.1646850707.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 9. M=E4rz 2022 19:21:18 CET Christian Schoenebeck wrote:
> Previous 9p patch fixed 'Twalk' request handling, which was previously not
> behaving as specified by the 9p2000 protocol spec. This patch adds a new
> test case which guards the new 'Twalk' behaviour in question.
>=20
> More specifically: it sends a 'Twalk' request where the 1st path component
> is valid, whereas the 2nd path component transmitted to server does not
> exist. The expected behaviour is that 9p server would respond by sending
> a 'Rwalk' response with exactly 1 QID (instead of 'Rlerror' response).
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/virtio-9p-test.c | 42 +++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 9098e21173..f29de1ca64 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -638,8 +638,12 @@ static void do_version(QVirtio9P *v9p)
>      g_assert_cmpmem(server_version, server_len, version, strlen(version)=
);
>  }
>=20
> -/* utility function: walk to requested dir and return fid for that dir */
> -static uint32_t do_walk(QVirtio9P *v9p, const char *path)
> +/*
> + * utility function: walk to requested dir and return fid for that dir a=
nd
> + * the QIDs of server response
> + */
> +static uint32_t do_walk_rqids(QVirtio9P *v9p, const char *path, uint16_t
> *nwqid, +                              v9fs_qid **wqid)
>  {
>      char **wnames;
>      P9Req *req;
> @@ -649,12 +653,18 @@ static uint32_t do_walk(QVirtio9P *v9p, const char
> *path)
>=20
>      req =3D v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
>      v9fs_req_wait_for_reply(req, NULL);
> -    v9fs_rwalk(req, NULL, NULL);
> +    v9fs_rwalk(req, nwqid, wqid);
>=20
>      split_free(&wnames);
>      return fid;
>  }
>=20
> +/* utility function: walk to requested dir and return fid for that dir */
> +static uint32_t do_walk(QVirtio9P *v9p, const char *path)
> +{
> +    return do_walk_rqids(v9p, path, NULL, NULL);
> +}
> +
>  /* utility function: walk to requested dir and expect passed error respo=
nse
> */ static void do_walk_expect_error(QVirtio9P *v9p, const char *path,
> uint32_t err) {
> @@ -1048,9 +1058,33 @@ static void fs_walk_nonexistent(void *obj, void
> *data, QGuestAllocator *t_alloc) alloc =3D t_alloc;
>=20
>      do_attach(v9p);
> +    /*
> +     * The 9p2000 protocol spec sais: "If the first element cannot be
> walked +     * for any reason, Rerror is returned."
> +     */
>      do_walk_expect_error(v9p, "non-existent", ENOENT);
>  }
>=20
> +static void fs_walk_2nd_nonexistent(void *obj, void *data,
> +                                    QGuestAllocator *t_alloc)
> +{
> +    QVirtio9P *v9p =3D obj;
> +    alloc =3D t_alloc;
> +    uint16_t nwqid;
> +    g_autofree v9fs_qid *wqid =3D NULL;
> +    g_autofree char *path =3D g_strdup_printf(
> +        QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
> +    );
> +
> +    do_attach(v9p);
> +    do_walk_rqids(v9p, path, &nwqid, &wqid);
> +    /*
> +     * The 9p2000 protocol spec sais: "nwqid is therefore either nwname =
or
> the +     * index of the first elementwise walk that failed."
> +     */
> +    assert(nwqid =3D=3D 1);
> +}

I should probably extend this test case with a separate 7th patch to check=
=20
that fid was really unaffected by Twalk, by comparing the QID before vs. af=
ter=20
the walk (similar to what patch 3 does).

> +
>  static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
>  {
>      QVirtio9P *v9p =3D obj;
> @@ -1531,6 +1565,8 @@ static void register_virtio_9p_test(void)
>                   fs_walk_dotdot,  &opts);
>      qos_add_test("synth/walk/non_existent", "virtio-9p",
> fs_walk_nonexistent, &opts);
> +    qos_add_test("synth/walk/2nd_non_existent", "virtio-9p",
> +                 fs_walk_2nd_nonexistent, &opts);
>      qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen,  &opts);
>      qos_add_test("synth/write/basic", "virtio-9p", fs_write,  &opts);
>      qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,



