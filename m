Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A65170265B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:49:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySwk-0005Ql-4m; Mon, 15 May 2023 03:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pySwf-0005QV-1X
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:48:37 -0400
Received: from pv50p00im-zteg10021301.me.com ([17.58.6.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pySwX-0007gg-Uf
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1684136907; bh=kxq8Oj2ZwUpxLib72H3lyOgyar3jY2xOLpFkaFqiiSo=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=axio9COC1koqe30kkcZyOZQLSMCBPyMXEvV00ylgGACU4t2RWQkcg5t5ZMoX3/3Y+
 iAgDBuZ5xYGFZPtQx27IB48excVSr/i5WKfQVH6YRf8wrj4ldxn+H8z6W+zLf/YwGq
 HHfoado7DRMHc23ebMfyxWwajJOQWMEXFPLKyYYWW5w5NdC7UeDIzAKthcXcDyrR53
 k5MfM4Fn8lbNyr/1uHKdzYn21BhuEhTvAInkCIOXOcCewqrNhs6Z9Pm4e94xAldl3B
 G3M9OwSLx7gIGF/jYtnX6suhyTBhGJCphQ7pgeZ09r6CatQSmYYeichqnnkM6UJQ66
 Hh7byvWQfHpDQ==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id 7582850065F;
 Mon, 15 May 2023 07:48:25 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 05/12] simpletrace: Changed Analyzer class to become
 context-manager
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230509144004.GH1008478@fedora>
Date: Mon, 15 May 2023 09:48:16 +0200
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA332EB4-A4A1-4557-A2A0-394F3ED88A0B@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-6-mads@ynddal.dk> <20230509144004.GH1008478@fedora>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Proofpoint-GUID: b8CD7G-PQ-39ko13JZcl67kgRleckO-5
X-Proofpoint-ORIG-GUID: b8CD7G-PQ-39ko13JZcl67kgRleckO-5
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 clxscore=1030 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305150069
Received-SPF: pass client-ip=17.58.6.46; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-zteg10021301.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


>=20
> Bearing in mind compatibility with existing simpletrace analysis
> scripts, how about the following default method implementations?
>=20
>  def __enter__(self):
>      self.begin()
>=20
>  def __exit__(self, exc_type, exc_val, exc_tb):
>      if exc_type is None:
>          self.end()
>      return False
>=20
> Now simpletrace.py can switch to using the context manager and new
> scripts can implement __enter__()/__exit__(), while old scripts =
continue
> to work.

I was considering the same, but I was worried about double =
initialization if
someone used both the context manager as well as calling .begin(). =
Should we add
a guard, that prohibits this?

Otherwise, we could also keep begin()/end() in Analyzer, and then make =
Analyzer2
a context manager?

>=20
> Please don't change the function signature since this is a public =
method
> and we should avoid breaking existing callers when possible.
>=20
> Instead of:
>=20
>  with analyzer_class() as analyzer:
>=20
> we can use:
>=20
>  with analyzer:
>      ...

I didn't think of that. Let's do this, if we keep the context manager.=

