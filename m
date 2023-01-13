Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57278669FBB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:17:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNa5-0004tn-D0; Fri, 13 Jan 2023 12:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pGNa2-0004tF-UA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:11:02 -0500
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pGNZy-0007bj-RF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:11:02 -0500
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230113171052usoutp025ecf1fffc83dba7448255c8abe17af1f~57XvlDx1v1321113211usoutp02I;
 Fri, 13 Jan 2023 17:10:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230113171052usoutp025ecf1fffc83dba7448255c8abe17af1f~57XvlDx1v1321113211usoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673629852;
 bh=IsA1cTxHBvtdMtk/8+g1YA7JWrOJwYtkZ26G5b/V+5Q=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=ZeQ+4HkktiQMZfhrygeVEtrsDvXtJ3o6rXFIiNsckZeb3cx4f3u3e/qZy7IYcedJz
 wBrCeLCH9dpO3RlZYv8dXpTlZtrSvVUSFsbbY52/9Z6nRHfn0Epra8S3jdRqy/Ge/+
 n+2oJqU5Z67VBR0ARXa/6jHSpZHFjYGwB9iAFoHQ=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230113171052uscas1p1e9a4c2e60a2d608ed82c8e616836c832~57XvOJkOs2991229912uscas1p1M;
 Fri, 13 Jan 2023 17:10:52 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id AA.E6.51548.C9091C36; Fri,
 13 Jan 2023 12:10:52 -0500 (EST)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230113171052uscas1p19f9ede8de304612e8cb527a435704c1f~57Xu35-rS2816928169uscas1p1q;
 Fri, 13 Jan 2023 17:10:52 +0000 (GMT)
X-AuditID: cbfec36f-813ff7000002c95c-10-63c1909ca672
Received: from SSI-EX4.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 82.9B.07297.B9091C36; Fri,
 13 Jan 2023 12:10:51 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Fri, 13 Jan 2023 09:10:51 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Fri,
 13 Jan 2023 09:10:51 -0800
From: Fan Ni <fan.ni@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "alison.schofield@intel.com" <alison.schofield@intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>, Adam Manzanares
 <a.manzanares@samsung.com>, "bwidawsk@kernel.org" <bwidawsk@kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [RFC] cxl-host: Fix committed check for passthrough decoder
Thread-Topic: [RFC] cxl-host: Fix committed check for passthrough decoder
Thread-Index: AQHZJuXhSxTSwCcfWUCp6ChLVpTS/a6coGWAgAB74IA=
Date: Fri, 13 Jan 2023 17:10:51 +0000
Message-ID: <20230113171044.GA24788@bgt-140510-bm03>
In-Reply-To: <20230113094725.0000705c@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0992D790876E4A4BB80C29C0E04E1611@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djX87pzJhxMNvi3Qsbi7uMLbBbNkxcz
 WnSf38BoMX3qBUaL1TfXMFo0ND1isWjZ/Z7JYv/T5ywWqxZeY7M4P+sUi8Xx3h0sDtweFyZP
 YPVY3ODq0XLkLZCx5yWTx6ZVnWweGz/+Z/d4cm0zk8fU2fUenzfJBXBGcdmkpOZklqUW6dsl
 cGUsXJ1ZsEur4sKNk6wNjIcVuxg5OSQETCRuTe9h6WLk4hASWMko8Wn1Y1YIp5VJ4uzEhSww
 Vdeff2KGSKxllGidtgnK+cQoMf/WJnYIZxmjxMqnT1lBWtgEFCX2dW1nA7FFBIwkriw7CFbE
 LLCLReLinhZGkISwgIdE98tedogiT4nmE9eAmjmAbCuJ73+cQMIsAqoS0xcvZwKxeYHO+Ln9
 MNh8TgFDiVnLzoCdxyggJvH91BqwGmYBcYlbT+YzQZwtKLFo9h5mCFtM4t+uh2wQtqLE/e8v
 2SHqdSQW7P7EBmHbSayb38wIYWtLLFv4mhlir6DEyZlPoEEhKXFwxQ1wgEkITOaUmLPzBStE
 wkWie8pTdghbWuLv3WVQRxRLnJ75khmioYFRYt2dG1AN1hIL/6xnmsCoMgvJ4bOQHDULyVGz
 kBw1C8lRCxhZVzGKlxYX56anFhvlpZbrFSfmFpfmpesl5+duYgSmu9P/DufvYLx+66PeIUYm
 DsZDjBIczEoivHuO7k8W4k1JrKxKLcqPLyrNSS0+xCjNwaIkztu9dX6ykEB6YklqdmpqQWoR
 TJaJg1OqgUns7qqTcdyPNeatfr/q0JrlSh/WmU9NrFELeTPj7HLTRcfXCdgJ8J/Tu7Nl/6V/
 +6552/3VUmK/XuL5+C3n/WaFiKzp596cOH5Iu3CD2pae6pak41cuXei63/Dn3/JZkWyf7vvb
 TBLr++0cpBM/uZ+NZ4Xzqz0pecIsCtGv9n9bdZFr2to52sUBS1iSg13OS12aXKf5R+Hy/84q
 BlE2QUXD9dkqqZWeP3bWZi468NZswX+O5uUTd3W/eyL+5FdN4w0bv74FCyfPO/Rg7tm3D04f
 2XPqwLP9DyLYVp/vO7Rt+zyOyYd/y1/SUXW2dt+1akNWjVFmQdvrGBO5ozffJHApa1nta/43
 ff+Vso3Nu9QyXJRYijMSDbWYi4oTASsPbxnmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWS2cA0SXf2hIPJBmd7rC3uPr7AZtE8eTGj
 Rff5DYwW06deYLRYfXMNo0VD0yMWi5bd75ks9j99zmKxauE1Novzs06xWBzv3cHiwO1xYfIE
 Vo/FDa4eLUfeAhl7XjJ5bFrVyeax8eN/do8n1zYzeUydXe/xeZNcAGcUl01Kak5mWWqRvl0C
 V8bC1ZkFu7QqLtw4ydrAeFixi5GTQ0LAROL680/MXYxcHEICqxklrjUuYoNwPjFKHDz7hBWk
 SkhgGaPE5h5uEJtNQFFiX9d2NhBbRMBI4sqyg+wgDcwCu1gkLu5pYQRJCAt4SHS/7GWHKPKU
 aD5xDWgQB5BtJfH9jxNImEVAVWL64uVMIDYv0BU/tx9mhVi8iVFi3rd+sF5OAUOJWcvOsIDY
 jAJiEt9PrQFrYBYQl7j1ZD4TxAsCEkv2nGeGsEUlXj7+xwphK0rc//6SHaJeR2LB7k9sELad
 xLr5zYwQtrbEsoWvmSGOEJQ4OfMJC0SvpMTBFTdYJjBKzEKybhaSUbOQjJqFZNQsJKMWMLKu
 YhQvLS7OTa8oNspLLdcrTswtLs1L10vOz93ECEwTp/8djt7BePvWR71DjEwcjIcYJTiYlUR4
 9xzdnyzEm5JYWZValB9fVJqTWnyIUZqDRUmc92XUxHghgfTEktTs1NSC1CKYLBMHp1QDE4e4
 p+/LjYbHxHhXP2Zk6zq2XV0rUqaR/fpyE+OWRvabzFqnrA0Pzuf0XnwsZeHdMmPHfwvf7u8o
 S+Ni+3z78JeuXvugso/f1CYL7Y0+zqzwnTXaX83VxpnpVOeaG3u+lRzJcJqmHLDdwLN7Zusf
 6RYm6a8+qQeak1yc+lq/Cc5/IX3hamD7C8/fotdY/OYscX+rwXlzRlvlqwIvZp5UJ5+vSsqd
 Z8qEXsV4VH/Smsq0IPfgI43clqUP9Wa/5Sw/73rwc3r5jslVmhcLa0vydv4WW5D0clXb5CaN
 YD276g/P3U1dp3OJtGQYTGmuj2g2+3pNfIfEIibW9VKsMz+UOid4RDLci7gUK/R55nQlluKM
 REMt5qLiRADNvTtoggMAAA==
X-CMS-MailID: 20230113171052uscas1p19f9ede8de304612e8cb527a435704c1f
CMS-TYPE: 301P
X-CMS-RootMailID: 20230113002756uscas1p2b602bff26576110407491f67eff5e065
References: <CGME20230113002756uscas1p2b602bff26576110407491f67eff5e065@uscas1p2.samsung.com>
 <20230113002727.11411-1-fan.ni@samsung.com>
 <20230113094725.0000705c@Huawei.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=fan.ni@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Jan 13, 2023 at 09:47:25AM +0000, Jonathan Cameron wrote:

> On Fri, 13 Jan 2023 00:27:55 +0000
> Fan Ni <fan.ni@samsung.com> wrote:
>=20
> > For passthrough decoder (a decoder hosted by a cxl component with only
> > one downstream port), its cache_mem_registers field COMMITTED
> > (see spec 2.0 8.2.5.12 - CXL HDM Decoder Capability Structure) will not
> > be set by the current Linux CXL driver. Without the fix, for a cxl
> > topology setup with a single HB and single root port, the memdev read/w=
rite
> > requests cannot be passed to the device successfully as the function
> > cxl_hdm_find_target will fail the decoder COMMITTED check and return
> > directly, which causes read/write not being directed to cxl type3 devic=
e.
> >=20
> > Before the fix, a segfault is observed when trying using cxl memory for
> > htop command through 'numactl --membind' after converting cxl memory
> > into normal RAM.
>=20
> We also need to fix that segfault.
With the patch, we do not see the segfault anymore. The segfault was
there before the patch because for a passthrough decoder, we cannot find a
target as the committed field check cannot pass, the read request will
return 0 (in cxl_read_cfmws) which can be used for futher addressing.
With the patch, we skip the committed check for passthrough decoder and
the requests can be passed to the device so the segfault is fixed. Our
concern is that the fix may also let the requests pass for unprogrammed
decoder, which is not allowed in current code.
>=20
>=20
> >=20
> > Detailed steps to reproduce the issue with the cxl setup where there is
> > only one HB and a memdev is directly attached to the only root port of
> > the HB are listed as below,
> > 1. cxl create-region region0
> > 2. ndctl create-namespace -m dax -r region0
> > 3. daxctl reconfigure-device --mode=3Dsystem-ram --no-online dax0.0
> > 4. daxctl online-memory dax0.0
> > 5. numactl --membind=3D1 htop
> >=20
> > Signed-off-by: Fan Ni <fan.ni@samsung.com>
>=20
> Ah. This mess is still going on. I've not been testing with this
> particular combination because the kernel didn't support it.
> The kernel code assumes that the implementation made the choice
> (which is an option in the spec) to not have any HDM decoders
> for the pass through case. As such it never programmed them
> (if you dig back a long way in the region bring patch sets in the
> kernel you'll find some discussion of this). Now I knew that meant
> the configuration didn't 'work' but nothing should be crashing -
> unless you mean that something in linux userspace is trying to
> access the memory and crashing because that fails
> (which is fine as far as I'm concerned ;)
>=20
> The work around for QEMU testing so far has been to add another root
> port and put nothing below that. The HDM decoders then have to be
> implemented so the kernel does what we expect.
Do you mean we already have the workaround somewhere or it is what we
have planned? currently the kernel will create a passthrough decoder if
the number of downstream is 1. If we have the workaround, there
should never be a passthrough decoder being created and we should not
see the issue.
>=20
> I'm not against a more comprehensive fix.  Two options come to mind.
> 1) Add an option to the host bridge device to tell it not to implement
>    hdm decoders at all. I'm not keen to just automatically drop them
>    because having decoders on a pass through HB is a valid configuration.
> 2) Cheat and cleanly detect a pass through situation and let the accesses
>    through.  I'm not particularly keen on this option though as it
>    will fail to test the code once it's 'fixed' in Linux.  IIRC the spec
>    doesn't say that programming such an HDM decoder is optional.
>=20
> I guess we could be a bit naughty with option 1 and flip the logic even
> though it would break backwards compatibility. So default to no HDM decod=
er.
> I doubt anyone will notice given that's the configuration that would have
> worked.  However I would want to keep the option to enable these decoders
> around.  I can spin up a patch or do you want to do it? My suggestion is =
option
> 1 with default being no HDM decoder.
>=20
> Jonathan
Please feel free to spin up a patch.
>=20
>=20
>=20
> > ---
> >  hw/cxl/cxl-host.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> > index 1adf61231a..5ca0d6fd8f 100644
> > --- a/hw/cxl/cxl-host.c
> > +++ b/hw/cxl/cxl-host.c
> > @@ -107,8 +107,11 @@ static bool cxl_hdm_find_target(uint32_t *cache_me=
m, hwaddr addr,
> >      uint32_t target_idx;
> > =20
> >      ctrl =3D cache_mem[R_CXL_HDM_DECODER0_CTRL];
> > -    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
> > -        return false;
> > +
> > +    /* skip the check for passthrough decoder */
>=20
> You have a mix of spaces and tabs for indentation. Should all be 4 spaces
> for QEMU code.
>=20
> > +	if (FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT)
> > +		&& !FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
> > +		return false;
>=20
> Why is this code specific to a pass through decoder?
> All it's telling us (I think) is no one tried to commit the decoder yet.
>=20
> >      }
> > =20
> >      ig_enc =3D FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);
> =

