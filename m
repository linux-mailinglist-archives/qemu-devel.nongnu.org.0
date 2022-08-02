Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA039587527
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 03:48:18 +0200 (CEST)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIh0z-0002Zw-L1
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 21:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oIgxy-0000va-9n
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:45:02 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oIgxt-0004P8-Jb
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:45:00 -0400
Received: from canpemm100005.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Lxd763qsmzGpK6;
 Tue,  2 Aug 2022 09:43:30 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 canpemm100005.china.huawei.com (7.192.105.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 2 Aug 2022 09:44:46 +0800
Received: from kwepemm600015.china.huawei.com ([7.193.23.52]) by
 kwepemm600015.china.huawei.com ([7.193.23.52]) with mapi id 15.01.2375.024;
 Tue, 2 Aug 2022 09:44:46 +0800
To: Markus Armbruster <armbru@redhat.com>
CC: "kwolf@redhat.com" <kwolf@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "Wangxin (Alexander)" <wangxinxin.wang@huawei.com>
Subject: Re: [PATCH v4 2/3] job: introduce dump guest memory job
Thread-Topic: [PATCH v4 2/3] job: introduce dump guest memory job
Thread-Index: AdimEW+2+ReL+txUSUqIWNY4HEI67Q==
Date: Tue, 2 Aug 2022 01:44:46 +0000
Message-ID: <6eeba8d025bf4ecf86abf66a828d4a2c@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.172]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=hogan.wang@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  "Wangjing(Hogan)" <hogan.wang@huawei.com>
From:  "Wangjing(Hogan)" via <qemu-devel@nongnu.org>

> Hogan Wang <hogan.wang@huawei.com> writes:
>=20
> > There's no way to cancel the current executing dump process, lead to=20
> > the virtual machine manager daemon((e.g. libvirtd) cannot restore the=20
> > dump job after daemon restart.
> >
> > Introduce dump guest memory job type, and add an optional 'job-id'
> > argument for dump-guest-memory QMP to make use of jobs framework.
> >
> > Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> > ---
> >  dump/dump-hmp-cmds.c | 12 ++++++++++--
> >  dump/dump.c          |  1 +
> >  qapi/dump.json       |  6 +++++-
> >  qapi/job.json        |  5 ++++-
> >  4 files changed, 20 insertions(+), 4 deletions(-)
> >
> > @@ -62,10 +64,16 @@ void hmp_dump_guest_memory(Monitor *mon, const QDic=
t *qdict)
> >          detach =3D qdict_get_bool(qdict, "detach");
> >      }
> > =20
> > +    if (has_job_id) {
> > +        job_id =3D qdict_get_str(qdict, "job-id");
> > +    }
> > +
>=20
> Simpler:
>=20
>        const char *job_id =3D qdict_get_try_str(qdict, "job-id");
>=20
> >      prot =3D g_strconcat("file:", file, NULL);
> > =20
> > -    qmp_dump_guest_memory(paging, prot, true, detach, has_begin, begin=
,
> > -                          has_length, length, true, dump_format, &err)=
;
> > +    qmp_dump_guest_memory(paging, prot, has_job_id, job_id,
>=20
> This becomes
>=20
>        qmp_dump_guest_memory(paging, prot, !!job_id, job_id,
>=20
> then.
>=20
Accept the improvements.

> > --- a/qapi/dump.json
> > +++ b/qapi/dump.json
> > @@ -59,6 +59,9 @@
> >  #            2. fd: the protocol starts with "fd:", and the following =
string
> >  #               is the fd's name.
> >  #
> > +# @job-id: identifier for the newly-created memory dump job. To be com=
patible
> > +#          with legacy dump process, @job-id should omitted. (Since 7.=
2)
> > +#
>=20
> I think we need to describe things in more detail.
>=20
> What are the behavioral differences between dumping with and without @job=
-id?
>=20
> Why would you want to pass @job-id?  I figure it's to gain the ability to=
 monitor and control dump task with query-job, job-cancel, ...
>=20
Thanks for your review comments, I will write the detailed comment for @job=
-id in patch set for the next version.

> >  # @detach: if true, QMP will return immediately rather than
> >  #          waiting for the dump to finish. The user can track progress
> >  #          using "query-dump". (since 2.6).
>=20
> Hmm, does "detach": false make any sense when "job-id" is present?
>=20
I had tested in my environment,  "detach": false haven't got any sense when=
 "job-id" is present,cann't cancel and query the job.
I will delete the code condition branch for non-detach dump job.

> Preexisting: @detach's default is undocumented.

Hogan Wang

