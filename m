Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9946A5D7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 20:42:40 +0100 (CET)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muJsl-000052-DY
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 14:42:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1muJqp-0007Mb-Ax; Mon, 06 Dec 2021 14:40:39 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1muJqm-0005kY-PV; Mon, 06 Dec 2021 14:40:39 -0500
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J7DKp1CltzcbnC;
 Tue,  7 Dec 2021 03:40:14 +0800 (CST)
Received: from dggpemm500012.china.huawei.com (7.185.36.89) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 03:40:25 +0800
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpemm500012.china.huawei.com (7.185.36.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 03:40:24 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.020;
 Tue, 7 Dec 2021 03:40:24 +0800
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Konobeev Vladimir
 <konobeev.vladimir@huawei.com>, Plotnik Nikolay <plotnik.nikolay@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "Emilio G. Cota" <cota@braap.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "Chengen (William, FixNet)" <chengen@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Suggestions for TCG performance improvements
Thread-Topic: Suggestions for TCG performance improvements
Thread-Index: AQHX52GV5RpBCy0TxkCBqrK5dfMw1Q==
Date: Mon, 6 Dec 2021 19:40:24 +0000
Message-ID: <35631f7cceb141879aa7475ccaf81acb@huawei.com>
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org> <7d137a2403be43b7a1c5857e96866403@huawei.com>
 <87v905wq6d.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.169.108]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=vasilev.oleg@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Vasilev Oleg <vasilev.oleg@huawei.com>
From:  Vasilev Oleg via <qemu-devel@nongnu.org>

On 12/3/2021 8:32 PM, Alex Benn=E9e wrote:=0A=
> Vasilev Oleg <vasilev.oleg@huawei.com> writes:=0A=
>=0A=
>> On 12/2/2021 7:02 PM, Alex Benn=E9e wrote:=0A=
>>=0A=
>>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:=0A=
...skipped...=0A=
>>> I did ponder a debug mode which would keep the last N tables dropped by=
=0A=
>>> tlb_mmu_resize_locked and then measure the differences in the entries=
=0A=
>>> before submitting the free to an rcu tasks.=0A=
>>>> The mentioned paper[4] also describes other possible improvements.=0A=
>>>> Some of those are already implemented (such as victim TLB and dynamic=
=0A=
>>>> size for TLB), but others are not (e.g. TLB lookup uninlining and=0A=
>>>> set-associative TLB layer). Do you think those improvements=0A=
>>>> worth trying?=0A=
>>> Anything is worth trying but you would need hard numbers. Also its all=
=0A=
>>> too easy to target micro benchmarks which might not show much differenc=
e=0A=
>>> in real world use. =0A=
>> The  mentioned paper presents some benchmarking, e. g. linux kernel=0A=
>> compilation and some other stuff. Do you think those shouldn't be=0A=
>> trusted?=0A=
> No they are good. To be honest it's the context switches that get you.=0A=
> Look at "info jit" between a normal distro and a initramfs shell. Places=
=0A=
> where the kernel is switching between multiple maps means a churn of TLB=
=0A=
> data.=0A=
>=0A=
> See my other post with a match of "msr ttrb"=0A=
Sorry, couldn't find what you are referring to. Could you, please, share=0A=
a link?=0A=
>>>> Another idea for decreasing occurence of TLB refills is to make TBs ke=
y=0A=
>>>> in htable independent of physical address. I assume it is only needed=
=0A=
>>>> to distinguish different processes where VAs can be the same.=0A=
>>>> Is that assumption correct?=0A=
>> This one, what do you think? Can we replace physical address as part=0A=
>> of a key in TB htable with some sort of address space identifier?=0A=
> Hmm maybe - so a change in ASID wouldn't need a total flush?=0A=
=0A=
No, I think it would need a flush since regular memory accesses need to=0A=
be in the correct address space. But, we won't need to access TLB when=0A=
looking for the next TB. Also, TLB wouldn't need to be filled with code=0A=
pages, only data pages.=0A=
=0A=
Overall, thanks for your feedback on those ideas.=0A=
=0A=
Oleg=0A=
=0A=
=0A=
...skipped...=0A=
=0A=
=0A=

