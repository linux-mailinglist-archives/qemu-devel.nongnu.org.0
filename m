Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67AB34E492
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 11:39:12 +0200 (CEST)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRAq7-00070X-R7
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 05:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lRAoY-0006Te-W1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:37:37 -0400
Received: from mail-ve1eur03hn2229.outbound.protection.outlook.com
 ([52.100.16.229]:27713 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lRAoQ-00060o-Ha
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 05:37:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7AjNh4YoJrXqP5g0qkCywTZ5PIUbUABMrt0j+NzwcDsDIFDPuphZo2qtGmtsXPcO/lqaGs1+1EX20Jo1qhMuVBmmisWawIuLmAQCafB+kChksxctn+6JJR1aWJhhIymWLQTWCDL58alrMqTKaWIr7DQ2nv0uuxScVt8uEth4XNqSWbeKgAb1jPkwHq0IizqQojhxOuWnwUzPSjNumj0PFsJeWiuQ8uhJEoA4E8/TDPl6VbKJLwR7YeI0O7FkhpUN+RsoeNLLpytuJUOnqUBgp9ULTzpBLVr+FwPmfm6vh/EVqBKGkL0S/tYgeQi091EZ86EMtLq+FOJhxOnz39GFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv00a12bNgD94e7yPYzrOnwHnAAqb8CXgwR9JZJU4Ck=;
 b=YQkYgMtyTbALu4iWO6LiiuguSU+mAgxQSwHeOzl+6ImaASu8f1dEgpF/Uo3SAGsk5KnWZMj4jLhYC3afjfdivZPEV0yJGOsKoanQWhaUINmfQhXQeMn+3Ogyc7rJ+F5OHJk3fN0l5Pr1rQLsrbxPhojrYN78RieFnMjk6nHc88AKKoFw6IfWxlFv01UgV+RubefRDdXBydCT3Cf6cH0NsgwowgobH4kWSYMsXyz63Bdhp+2Qr6Q9j9fxgwIZnKtIvwsnM+9ziV3CA47RscSbaue4us+FGObOx3JOrux2RAW8I0t/RbBCuJufdHgpveek987LAYtBfTjyWneHJoL5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv00a12bNgD94e7yPYzrOnwHnAAqb8CXgwR9JZJU4Ck=;
 b=u+9RdaVtYGKKt2j7QgpIc44e06QpgD28uQw58JmIN9x1lg6xBUe0kefGjUWZQyH7iu7YhpC5rR9aNnyW3S8pGGI6ojjFW/9/okwl661CtqQ7/JifAZar9kdswtzQGMUZQqfAInq49VKBRFXTXOfL99w/D0KeYsZOe5d8iaZIxZs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 by AM8PR08MB6548.eurprd08.prod.outlook.com (2603:10a6:20b:314::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 09:37:16 +0000
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97]) by AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97%7]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 09:37:16 +0000
Date: Tue, 30 Mar 2021 12:37:11 +0300
From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210330093711.GA843813@dhcp-172-16-24-191.sw.ru>
References: <20210325165705.2342-1-valeriy.vdovin@virtuozzo.com>
 <20210330021510.0fb2fa53@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330021510.0fb2fa53@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [185.231.240.5]
X-ClientProxiedBy: AM0PR02CA0143.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::10) To AM9PR08MB5988.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-172-16-24-191.sw.ru (185.231.240.5) by
 AM0PR02CA0143.eurprd02.prod.outlook.com (2603:10a6:20b:28d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Tue, 30 Mar 2021 09:37:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c9938ff-e5e7-40db-095d-08d8f35f6804
X-MS-TrafficTypeDiagnostic: AM8PR08MB6548:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB65480720463FF36D3F14B462877D9@AM8PR08MB6548.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:AM9PR08MB5988.eurprd08.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39840400004)(366004)(7696005)(86362001)(9686003)(316002)(6666004)(44832011)(956004)(6506007)(30864003)(8676002)(8936002)(186003)(52116002)(1076003)(16526019)(2906002)(66946007)(66476007)(54906003)(26005)(107886003)(4326008)(5660300002)(55016002)(83380400001)(36756003)(33656002)(66556008)(6916009)(38100700001)(478600001)(30126003);
 DIR:OUT; SFP:1501; 
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H5MI9aBgh3IiJQD8ypOnByBmZIZk4iPMQsdpQTy/TeH7uNgGhBptgHgZoRoN?=
 =?us-ascii?Q?rbEE9fiUcViZ/U/HWdy25NrGb1fVDGbHWKqnsriCJCohOUDMQ4ubhfMZ/SHb?=
 =?us-ascii?Q?G1Oa9XRDa6R9csyR4GaKoLE9kcPp4+grVOEXkYV91bwIPVzAD1HK5wgi85pz?=
 =?us-ascii?Q?VyPWhbqAPoCrkEpQZouNgCybiAEAAFa5bLOLa9y95Mua4QDwYYO7Ud1kBxC+?=
 =?us-ascii?Q?YW+DuC9CNOh42fu/80gqQvvhZjb6WJu9FQrEKwZ2kfu92Jin/lFkqJAbZwnI?=
 =?us-ascii?Q?TtLvb9dC3LGdD1mFtCq6ftSVeeEBRWB3W0HBKT8NTXgXvc/UT65o3CzY0xq6?=
 =?us-ascii?Q?zeMHI2a/M4Nh8mADKUUf8Qcgv1HJ+/hMqIAVwN/OxxXpHS1/pagZDn04TWf7?=
 =?us-ascii?Q?sAjU4QOnY+efpvNYHuQHKCKPpG6EXl56hQK182gMJqV75D5oDFhfBZ8O0DSd?=
 =?us-ascii?Q?wlSWv1TzMcq4moqJoVLfujt3Os9NtJ+nWxa4gxpLtd+TTdMBbAzq0owJuXmW?=
 =?us-ascii?Q?qIe5sYmTZNdOb0lkDbYWO4BhSxrHA2WR5AhRITja3Qu+Z+jQc+7nzd4YCL50?=
 =?us-ascii?Q?DMfyBSbXU5hCs9SK8xNvc1pSfckSChuGN91025uz9QXCn0nQ2McT/BVlUlt8?=
 =?us-ascii?Q?MojLaRAQrAYFFq8us+VyKy+1JZbsi/h9GPK9zG28S86fhvAuvbEvdY/QdGcZ?=
 =?us-ascii?Q?XO8sLmh0KJvC4uhWfgS1HuNjiLU3uE0oSQm1G3uqCFvovZId1f+2LvsVBfH/?=
 =?us-ascii?Q?o+ShqJToJaK222u04U5WoYL2VCtAPkWZBheq4eU5ZMrUWvbVJkSWnHuwzUH6?=
 =?us-ascii?Q?6x0vLALMLVW8SOx6vdXLzu4W5+mRWvLrbVraDZWMVgO8HQ8510uFDeqF2++L?=
 =?us-ascii?Q?2iR6kMFeNW8JvzywHOzwny+jvGKs2er6pJnr5fWeXoT+29swwi5D7/AXNz0h?=
 =?us-ascii?Q?SDE6jPbmoduSwDTjbxjfOnPFm+FqyugRVlOquWWP08c=3D?=
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/+tXeh6Zru3EtsL7SgEUqShxIdsL/8KbN7riXGuJXvocbhq9sPcJkb73PlkJ?=
 =?us-ascii?Q?RLcjvBfVb5brkfndomFaSJKlwbbM21M9VwCGv9I57+uKEGtypbvuZ/dkpmjn?=
 =?us-ascii?Q?v+QjRRjx7WTjV5vkAq17W564zngel4aflVdmRbf+dQ8I6iLbaetdUwhFebu7?=
 =?us-ascii?Q?AvR4q5xORhzwCpFBTsWGrKvgogHLl3idv/bnZQ9hbXh0ewMU3VUp0ua5Jdcn?=
 =?us-ascii?Q?rQGC0nOF5lOG3CZzFzEMlCJFyQflkgO6dcj73M34cNQ3CddO/0Y0r8lFK8cs?=
 =?us-ascii?Q?wSAtZtA284jRA+Kdm8NMlGkEHa+SuI5s9yMqX9GOiReJqqSigJE+QwxmJytO?=
 =?us-ascii?Q?P2PuCwlIKmMFSMK3yMlx9qYLgaCBjcbJi2WhLcpqDttw1jZmZqCqoeChclPx?=
 =?us-ascii?Q?jUqb1Ay2J0mFciV53Okd+eVe2YvRXMcSwDVmNf92kABt12msNOnTzZj0CRVv?=
 =?us-ascii?Q?GA+B2HndpZ/sdXzfQXxxe/Q0W+r3/XEp440Aw5Ir1t2mhHkUnVu2eS5K8erL?=
 =?us-ascii?Q?dIsZxGVuFvniXbtyhKtdX7mGiPZyzB9KtxCTWWi5L7fLiVJAqxwP83CDG4JI?=
 =?us-ascii?Q?kq1n2Upc1qHze+05YgByfXqmVMzN1op7cz6YNflphUQn3P/Rc6fr2PWtfHrU?=
 =?us-ascii?Q?M0D8JXgzfGkpcSRJuHjPoRX/MEIOdglYfN/nzSVIKvEfm93JkjVVWD/2l+jk?=
 =?us-ascii?Q?0LyDD20VRyYluyeWPBCAJyqF1VKpfqh7qZCT4oLIleFAeZ04jKnpE7VcejUN?=
 =?us-ascii?Q?27WO7NZ9RC088JLNKORfx9ZpJTLfU8CjGsDrAeqiLssJd7zsco48aC/jnGhQ?=
 =?us-ascii?Q?TjYmBx8fbmihxP5dG7lYfBeR1gJn3XFOthtYDgJgLdAOCatPMLgVtIv+56rS?=
 =?us-ascii?Q?cHWUBnlheJoe0kty18okSG4bu1zqatMdh7Z0kAl3n8XtsLVw2DcfXibaQhMX?=
 =?us-ascii?Q?VVOl2VPTa3VCbh0ER3AI0cBGjqS9RtRzlGad7obdGFBOl2epE+y0ylLNScny?=
 =?us-ascii?Q?1saX94omZ3fecPlkDlCU2aSs1vGqR7ftyBFCQevRyIF6gVCYuuUB9zGi5CwK?=
 =?us-ascii?Q?YU2GgphXiXeeMKJ43TyUT2IxuiqlxquY2GS+klKl0pBUhfQLy8tF35QJo81l?=
 =?us-ascii?Q?qTJylRFF66EmHPtGMdthS2IWmoikgCyVlT428zaD1zjNo1jfswhV3o3RX65w?=
 =?us-ascii?Q?0h285OtDDyGX5GrPcTAojaZ6Y60JVk5UHWjeqIJ9mL1E4xe9M7JrNjCmzmMR?=
 =?us-ascii?Q?FGtZUx6Ejax/ULWC7k48j+kO+Winhi/deFVNTYYxc858C1n+gTFinbF+piCZ?=
 =?us-ascii?Q?fWrf6NTwV8deiNobyYT0TuUS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9938ff-e5e7-40db-095d-08d8f35f6804
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5988.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:37:16.7464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xp5gYYGvyOnIT0baCRi4Z+qfUOmYhwPU/yeeNdzvLecSyH8OnFs7cLT4VVz9raduE3Tq1d9ZqeT9PiJwAkUBBPLfdsu4/n9fDjCRXvTDcyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6548
Received-SPF: pass client-ip=52.100.16.229;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 02:15:10AM +0200, Igor Mammedov wrote:
> On Thu, 25 Mar 2021 19:57:05 +0300
> Valeriy Vdovin <valeriy.vdovin@virtuozzo.com> wrote:
> 
> > Introducing new qapi method 'query-cpu-model-cpuid'. This method can be used to
> > get virtualized cpu model info generated by QEMU during VM initialization in
> > the form of cpuid representation.
> > 
> > Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
> > command line option. From there it takes the name of the model as the basis for
> > feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
> > that state if additional cpu features should be present on the virtual cpu or
> > excluded from it (tokens '+'/'-' or '=on'/'=off').
> > After that QEMU checks if the host's cpu can actually support the derived
> > feature set and applies host limitations to it.
> > After this initialization procedure, virtual cpu has it's model and
> > vendor names, and a working feature set and is ready for identification
> > instructions such as CPUID.
> > 
> > Currently full output for this method is only supported for x86 cpus.
> > 
> > To learn exactly how virtual cpu is presented to the guest machine via CPUID
> > instruction, new qapi method can be used. By calling 'query-cpu-model-cpuid'
> > method, one can get a full listing of all CPUID leafs with subleafs which are
> > supported by the initialized virtual cpu.
> > 
> > Other than debug, the method is useful in cases when we would like to
> > utilize QEMU's virtual cpu initialization routines and put the retrieved
> > values into kernel CPUID overriding mechanics for more precise control
> > over how various processes perceive its underlying hardware with
> > container processes as a good example.
> 
> 
> existing 'query-cpu-definitions' does return feature bits that are actually
> supported by qemu/host combination, why do we need a second very simillar interface?
> 
We've examined 'query-cpu-definitions' as well as 'query-cpu-model-expansion', which
is even a better fit for the job. But both methods just provide a list of cpu features,
while leaving CPUID generation out of their scope.
Here is an example output from 'query-cpu-model-expansion':

{
"return": {
  "model": {
     "name": "max",
     "props": {
       "vmx-entry-load-rtit-ctl": false,
       "phys-bits": 0,
       "core-id": -1,
       "svme-addr-chk": false,
       "xlevel": 2147483656,
       "cmov": true,
       "ia64": false,
       "ssb-no": false,
       "aes": false,
       "vmx-apicv-xapic": true,
       ...

However having this information we are only half-way there. We now need to somehow 
convert all this information into CPUID leaves, that we will be able to give out 
to the callers of 'cpuid' instruction. As we can see in the above listing, the
field type is not even a uniform list of cpu features. It's an unordered information
that matters for virtual cpu presentation each in it's own way.

To construct CPUID leaves from that, the application should have ALL the knowledge
about each type of the above properties list. This is the kind of code writing that
we naturally want to evade knowing that there is a perfect function that already does
that.
I'm talking about 'cpu_x86_cpuid' in QEMU sources. It already does the whole CPUID
response construction. Just looking at its listing the function seems to be pretty
complex. So writing the same logic will repeat the same complexity and all risks.
Also it's in a public domain, so it's guaranteed to be revisisted, improved and
bug-fixed often.
So utilizing this function is an easy choice, in fact almost no choice. All we need 
is an api, that can fetch results from this function, which is exactly what our new
QMP method does. The method is pretty straightforward, so there will be not much to 
maintain, compared to the effort that would need to be done to support future CPU
features.

> > 
> > Output format:
> > The core part of the returned JSON object can be described as a list of lists
> > with top level list contains leaf-level elements and the bottom level
> > containing subleafs, where 'leaf' is CPUID argument passed in EAX register and
> > 'subleaf' is a value passed to CPUID in ECX register for some specific
> > leafs, that support that. Each most basic CPUID result is passed in a
> > maximum of 4 registers EAX, EBX, ECX and EDX, with most leafs not utilizing
> > all 4 registers at once.
> > Also note that 'subleaf' is a kind of extension, used by only a couple of
> > leafs, while most of the leafs don't have this. Nevertheless, the output
> > data structure presents ALL leafs as having at least a single 'subleaf'.
> > This is done for data structure uniformity, so that it could be
> > processed in a more straightforward manner, in this case no one suffers
> > from such simplification.
> > 
> > Use example:
> > virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
> > {
> >   "return": {
> >     "cpuid": {
> >       "leafs": [
> >         {
> >           "leaf": 0,
> >           "subleafs": [
> >             {
> >               "eax": 13,
> >               "edx": 1231384169,
> >               "ecx": 1818588270,
> >               "ebx": 1970169159,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >         {
> >           "leaf": 1,
> >           "subleafs": [
> >             {
> >               "eax": 329443,
> >               "edx": 529267711,
> >               "ecx": 4160369187,
> >               "ebx": 133120,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >         {
> >           "leaf": 2,
> >           "subleafs": [
> >             {
> >               "eax": 1,
> >               "edx": 2895997,
> >               "ecx": 0,
> >               "ebx": 0,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >       ]
> >     },
> >     "vendor": "GenuineIntel",
> >     "class-name": "Skylake-Client-IBRS-x86_64-cpu",
> >     "model-id": "Intel Core Processor (Skylake, IBRS)"
> >   },
> >   "id": "libvirt-40"
> > }
> > 
> > Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
> > ---
> > v2: - Removed leaf/subleaf iterators.
> >     - Modified cpu_x86_cpuid to return false in cases when count is
> >       greater than supported subleaves.
> > 
> >  qapi/machine-target.json | 122 +++++++++++++++++++++++
> >  target/i386/cpu.h        |   2 +-
> >  target/i386/cpu.c        | 209 +++++++++++++++++++++++++++++++++++----
> >  3 files changed, 315 insertions(+), 18 deletions(-)
> > 
> > diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> > index e7811654b7..c5b137aa5c 100644
> > --- a/qapi/machine-target.json
> > +++ b/qapi/machine-target.json
> > @@ -329,3 +329,125 @@
> >  ##
> >  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
> >    'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> > +##
> > +
> > +
> > +# @CpuidSubleaf:
> > +#
> > +# CPUID leaf extension information, based on ECX value.
> > +#
> > +# CPUID x86 instruction has 'leaf' argument passed in EAX register. Leaf
> > +# argument identifies the type of information, the caller wants to retrieve in
> > +# single call to CPUID.
> > +# Some but not all leaves depend on the value passed in ECX register as an
> > +# additional argument to CPUID. This argument is present in cpuid documentation
> > +# as 'subleaf'.
> > +# If CPUID ignores the value in ECX, normally this means that leaf does not
> > +# have subleaves. Another way to see it is that each leaf has at least one
> > +# subleaf (one type of output).
> > +#
> > +# @subleaf: value passed to CPUID in ECX register. If CPUID leaf has only a
> > +#           single leaf, the value of ECX is ignored by CPU and should as well
> > +#           be ignored in this field.
> > +# @eax: value in eax after CPUID instruction
> > +# @ebx: value in ebx after CPUID instruction
> > +# @ecx: value in ecx after CPUID instruction
> > +# @edx: value in edx after CPUID instruction
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'CpuidSubleaf',
> > +  'data': { 'subleaf' : 'int',
> > +            'eax': 'int',
> > +            'ebx': 'int',
> > +            'ecx': 'int',
> > +            'edx': 'int'
> > +          }
> > +}
> > +
> > +##
> > +# @CpuidLeaf:
> > +#
> > +# A single CPUID leaf.
> > +#
> > +# CPUID instruction accepts 'leaf' argument passed in EAX register.
> > +# A 'leaf' is a single group of information about the CPU, that is returned
> > +# to the caller in EAX, EBX, ECX and EDX registers. A few of the leaves will
> > +# also have 'subleaves', the group of information would partially depend on the
> > +# value passed in the ECX register. If the leaf has subleaves, it will
> > +# only have more than one item in 'subleaves' array. If the leaf has no
> > +# subleaves, only one item will be present in the 'subleaves' list.
> > +#
> > +# @leaf: CPUID leaf or the value of EAX prior to CPUID execution.
> > +# @subleaves: array of subleaves.
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'CpuidLeaf',
> > +  'data': { 'leaf' : 'int',
> > +            'subleaves' : [ 'CpuidSubleaf' ] } }
> > +
> > +##
> > +# @CpuModelCpuid:
> > +#
> > +# Virtual CPU model.
> > +#
> > +# A CPU model consists of the name of a CPU definition, to which
> > +# delta changes are applied (e.g. features added/removed). Most magic values
> > +# that an architecture might require should be hidden behind the name.
> > +# However, if required, architectures can expose relevant properties.
> > +#
> > +# @leaves: array of all available cpuid leaves
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'CpuModelCpuid',
> > +  'data': {  'leaves' : [ 'CpuidLeaf' ] }
> > +}
> > +
> > +##
> > +# @CpuModelCpuidDescription:
> > +#
> > +# Virtual CPU model.
> > +#
> > +# This describes information generated by QEMU and used by it to respond CPUID
> > +# requests from guest along with some general information about the cpu model,
> > +# that might be useful for the caller of qapi requests.
> > +#
> > +# @class-name: class name of the CPU model in qemu object model
> > +# @model-id: CPU model name string that will be passed in CPUID, EAX=0
> > +# @vendor: CPU vendor name string that will be passed in CPUID, EAX=0
> > +# @cpuid: Full tree of CPUID leaves, that is generated by QEMU at virtual cpu
> > +#         initialization step by parsing "-cpu " option and creating the virtual cpu
> > +#         model. CpuModelCpuidDescription can be examined to predict QEMU's response to
> > +#         CPUID instructions from the guest.
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'CpuModelCpuidDescription',
> > +  'data': {  'class-name': 'str',
> > +             'model-id': 'str',
> > +             'vendor' : 'str',
> > +             'cpuid' : 'CpuModelCpuid'
> > +          }
> > +}
> > +
> > +##
> > +# @query-cpu-model-cpuid:
> > +#
> > +# Returns description of a virtual CPU model, created by QEMU after cpu
> > +# initialization routines. The resulting information is a reflection of a parsed
> > +# '-cpu' command line option, filtered by available host cpu features.
> > +#
> > +# Returns:  @CpuModelCpuidDescription
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-cpu-model-cpuid" }
> > +# <- { "return": 'CpuModelCpuidDescription' }
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'command': 'query-cpu-model-cpuid',
> > +  'returns': 'CpuModelCpuidDescription',
> > +  'if': 'defined(TARGET_I386)' }
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 570f916878..19c1dfea60 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1926,7 +1926,7 @@ int cpu_x86_signal_handler(int host_signum, void *pinfo,
> >                             void *puc);
> >  
> >  /* cpu.c */
> > -void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> > +bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                     uint32_t *eax, uint32_t *ebx,
> >                     uint32_t *ecx, uint32_t *edx);
> >  void cpu_clear_apic_feature(CPUX86State *env);
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 6b3e9467f1..9f3bc7d448 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5148,6 +5148,161 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> >      return cpu_list;
> >  }
> >  
> > +/*
> > + * struct cpuid_leaf_range - helper struct that describes valid range of
> > + * cpuid leaves as returned by CPUID in response to EAX=0 or EAX=0x80000000,
> > + * etc.
> > + *
> > + * The purpose of this struct is to deal with a sparse nature of leaf value
> > + * space. Ther CPUID logic of returning the maximum leaf is not straightforward
> > + * and requires inner knowledge of what cpuid extensions are available on a
> > + * specific cpu. Also this logic is designed to be expandable across many years
> > + * ahead. QEMU code would have to be updated as well. That's why there should
> > + * be only one point where all cpuid leaf ranges logic will be modified.
> > + *
> > + * In practice this will be used to detect if any arbitrary cpuid leaf value
> > + * is valid for a specific cpu model. For that one will call
> > + * 'cpuid_get_cpuid_leaf_ranges' to get all valid ranges for a provided cpu
> > + * model and then call 'cpu_leaf_in_range' to find out which of the ranges
> > + * contains the leaf in question.
> > + */
> > +#define CPUID_MAX_LEAF_RANGES 4
> > +
> > +struct cpuid_leaf_range {
> > +    uint32_t min;
> > +    uint32_t max;
> > +};
> > +
> > +struct cpuid_leaf_ranges {
> > +    struct cpuid_leaf_range ranges[CPUID_MAX_LEAF_RANGES];
> > +    int count;
> > +};
> > +
> > +static void cpuid_get_cpuid_leaf_ranges(CPUX86State *env,
> > +                                        struct cpuid_leaf_ranges *r)
> > +{
> > +    struct cpuid_leaf_range *rng;
> > +
> > +    r->count = 0;
> > +    rng = &r->ranges[r->count++];
> > +    rng->min = 0x00000000;
> > +    rng->max = env->cpuid_level;
> > +
> > +    rng = &r->ranges[r->count++];
> > +    rng->min = 0x40000000;
> > +    rng->max = 0x40000001;
> > +
> > +    if (env->cpuid_xlevel) {
> > +        rng = &r->ranges[r->count++];
> > +        rng->min = 0x80000000;
> > +        rng->max = env->cpuid_xlevel;
> > +    }
> > +
> > +    if (env->cpuid_xlevel2) {
> > +        rng = &r->ranges[r->count++];
> > +        rng->min = 0xC0000000;
> > +        rng->max = env->cpuid_xlevel2;
> > +    }
> > +}
> > +
> > +static inline bool cpuid_leaf_in_range(uint32_t leaf,
> > +                                       struct cpuid_leaf_range *r)
> > +{
> > +    return leaf >= r->min && leaf <= r->max;
> > +}
> > +
> > +static uint32_t cpuid_limit_from_leaf(CPUX86State *env, uint32_t leaf)
> > +{
> > +    struct cpuid_leaf_ranges ranges;
> > +    struct cpuid_leaf_range *current_range, *end_range;
> > +
> > +    cpuid_get_cpuid_leaf_ranges(env, &ranges);
> > +    current_range = &ranges.ranges[0];
> > +    end_range = current_range + ranges.count;
> > +    while (current_range != end_range) {
> > +        if (cpuid_leaf_in_range(leaf, current_range)) {
> > +            break;
> > +        }
> > +        current_range++;
> > +    }
> > +    if (current_range != end_range) {
> > +        return current_range->max;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
> > +                                 Error **errp)
> > +{
> > +    struct cpuid_leaf_ranges ranges;
> > +    struct cpuid_leaf_range *range;
> > +    uint32_t eax, ebx, ecx, edx;
> > +    CpuidLeaf *leaf;
> > +    CpuidLeafList **leaf_tail;
> > +    CpuidSubleaf *subleaf;
> > +    CpuidSubleafList **subleaf_tail;
> > +    X86CPU *x86_cpu = X86_CPU(cpu);
> > +
> > +    int range_idx;
> > +    int leaf_idx, subleaf_idx;
> > +
> > +    info->cpuid = g_malloc0(sizeof(*info->cpuid));
> > +    leaf_tail = &info->cpuid->leaves;
> > +    info->model_id = object_property_get_str(cpu, "model-id", errp);
> > +    info->vendor = object_property_get_str(cpu, "vendor", errp);
> > +
> > +    cpuid_get_cpuid_leaf_ranges(&x86_cpu->env, &ranges);
> > +    for (range_idx = 0; range_idx < ranges.count; ++range_idx) {
> > +        range = &ranges.ranges[range_idx];
> > +        for (leaf_idx = range->min; leaf_idx <= range->max; ++leaf_idx) {
> > +            subleaf_idx = 0;
> > +            if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax, &ebx,
> > +                           &ecx, &edx)) {
> > +                continue;
> > +            }
> > +
> > +            leaf = g_malloc0(sizeof(*leaf));
> > +            leaf->leaf = leaf_idx;
> > +            subleaf_tail = &leaf->subleaves;
> > +            while (true) {
> > +                subleaf = g_malloc0(sizeof(*subleaf));
> > +                subleaf->subleaf = subleaf_idx;
> > +                subleaf->eax = eax;
> > +                subleaf->ebx = ebx;
> > +                subleaf->ecx = ecx;
> > +                subleaf->edx = edx;
> > +                QAPI_LIST_APPEND(subleaf_tail, subleaf);
> > +                subleaf_idx++;
> > +                if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax,
> > +                                   &ebx, &ecx, &edx)) {
> > +                    break;
> > +                }
> > +            }
> > +            QAPI_LIST_APPEND(leaf_tail, leaf);
> > +        }
> > +    }
> > +}
> > +
> > +CpuModelCpuidDescription *qmp_query_cpu_model_cpuid(Error **errp)
> > +{
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> > +    const char *class_name;
> > +    CpuModelCpuidDescription *info;
> > +    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME,
> > +                                          -1, &error_abort);
> > +    Object *cpu = ms->possible_cpus->cpus[0].cpu;
> > +
> > +    class_name = object_class_get_name(object_get_class(cpu));
> > +    info = g_malloc0(sizeof(*info));
> > +    info->class_name = g_strdup(class_name);
> > +
> > +    if (target == SYS_EMU_TARGET_X86_64) {
> > +        cpu_model_fill_cpuid(cpu, info, errp);
> > +    }
> > +
> > +    return info;
> > +}
> > +
> >  static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
> >                                                     bool migratable_only)
> >  {
> > @@ -5591,14 +5746,14 @@ void cpu_clear_apic_feature(CPUX86State *env)
> >  
> >  #endif /* !CONFIG_USER_ONLY */
> >  
> > -void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> > +bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                     uint32_t *eax, uint32_t *ebx,
> >                     uint32_t *ecx, uint32_t *edx)
> >  {
> >      X86CPU *cpu = env_archcpu(env);
> >      CPUState *cs = env_cpu(env);
> >      uint32_t die_offset;
> > -    uint32_t limit;
> > +    uint32_t limit, nr_subleaves = 1;
> >      uint32_t signature[3];
> >      X86CPUTopoInfo topo_info;
> >  
> > @@ -5607,15 +5762,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >      topo_info.threads_per_core = cs->nr_threads;
> >  
> >      /* Calculate & apply limits for different index ranges */
> > -    if (index >= 0xC0000000) {
> > -        limit = env->cpuid_xlevel2;
> > -    } else if (index >= 0x80000000) {
> > -        limit = env->cpuid_xlevel;
> > -    } else if (index >= 0x40000000) {
> > -        limit = 0x40000001;
> > -    } else {
> > -        limit = env->cpuid_level;
> > -    }
> > +    limit = cpuid_limit_from_leaf(env, index);
> >  
> >      if (index > limit) {
> >          /* Intel documentation states that invalid EAX input will
> > @@ -5675,8 +5822,18 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >              if ((*eax & 31) && cs->nr_cores > 1) {
> >                  *eax |= (cs->nr_cores - 1) << 26;
> >              }
> > +            if (*eax || *ebx || *ecx || *edx) {
> > +                /*
> > +                 * host_cpuid has returned some valid info, that means count
> > +                 * is a valid agrument. Now we need to return true at function
> > +                 * exit by altering nr_subleaves to pass the return condition.
> > +                 * This is special for leaf 4.
> > +                 */
> > +                nr_subleaves = count + 1;
> > +            }
> >          } else {
> >              *eax = 0;
> > +            nr_subleaves = 3;
> >              switch (count) {
> >              case 0: /* L1 dcache info */
> >                  encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
> > @@ -5724,6 +5881,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          break;
> >      case 7:
> >          /* Structured Extended Feature Flags Enumeration Leaf */
> > +
> > +        /*
> > +         * env->cpuid_level_func7 returns the maximum subleaf index, whereas
> > +         * nr_subleaves - is the count, that's why + 1.
> > +         */
> > +        nr_subleaves = env->cpuid_level_func7 + 1;
> >          if (count == 0) {
> >              /* Maximum ECX value for sub-leaves */
> >              *eax = env->cpuid_level_func7;
> > @@ -5777,12 +5940,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          /* Extended Topology Enumeration Leaf */
> >          if (!cpu->enable_cpuid_0xb) {
> >                  *eax = *ebx = *ecx = *edx = 0;
> > -                break;
> > +                return false;
> >          }
> >  
> >          *ecx = count & 0xff;
> >          *edx = cpu->apic_id;
> > -
> > +        nr_subleaves = 2;
> >          switch (count) {
> >          case 0:
> >              *eax = apicid_core_offset(&topo_info);
> > @@ -5812,6 +5975,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >  
> >          *ecx = count & 0xff;
> >          *edx = cpu->apic_id;
> > +        nr_subleaves = 3;
> >          switch (count) {
> >          case 0:
> >              *eax = apicid_core_offset(&topo_info);
> > @@ -5843,9 +6007,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *ecx = 0;
> >          *edx = 0;
> >          if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
> > -            break;
> > +            return false;
> >          }
> >  
> > +        nr_subleaves = ARRAY_SIZE(x86_ext_save_areas);
> >          if (count == 0) {
> >              *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
> >              *eax = env->features[FEAT_XSAVE_COMP_LO];
> > @@ -5876,9 +6041,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *edx = 0;
> >          if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) ||
> >              !kvm_enabled()) {
> > -            break;
> > +            return false;
> >          }
> >  
> > +        nr_subleaves = 2;
> >          if (count == 0) {
> >              *eax = INTEL_PT_MAX_SUBLEAF;
> >              *ebx = INTEL_PT_MINIMAL_EBX;
> > @@ -6031,6 +6197,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *eax = 0;
> >          if (cpu->cache_info_passthrough) {
> >              host_cpuid(index, count, eax, ebx, ecx, edx);
> > +            /*
> > +             * Because we pass to the host we can only check how it fills
> > +             * output registers to check if count arg is valid.
> > +             */
> > +            if (!(*eax || *ebx || *ecx || *edx)) {
> > +                return false;
> > +            }
> >              break;
> >          }
> >          switch (count) {
> > @@ -6052,7 +6225,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >              break;
> >          default: /* end of info */
> >              *eax = *ebx = *ecx = *edx = 0;
> > -            break;
> > +            nr_subleaves = 3;
> >          }
> >          break;
> >      case 0x8000001E:
> > @@ -6063,6 +6236,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >              *ebx = 0;
> >              *ecx = 0;
> >              *edx = 0;
> > +            return false;
> >          }
> >          break;
> >      case 0xC0000000:
> > @@ -6101,8 +6275,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *ebx = 0;
> >          *ecx = 0;
> >          *edx = 0;
> > -        break;
> > +        return false;
> >      }
> > +    return count < nr_subleaves ;
> >  }
> >  
> >  static void x86_cpu_reset(DeviceState *dev)
> 

