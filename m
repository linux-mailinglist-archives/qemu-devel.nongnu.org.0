Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339654217BE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 21:42:12 +0200 (CEST)
Received: from localhost ([::1]:37170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXTqk-0004DY-Kj
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 15:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mXTon-0002VU-Gf
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:40:09 -0400
Received: from mail-mw2nam08on20626.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::626]:57216
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mXTok-0007zb-6j
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:40:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CytjNV2W8dc7ZB9R83swxpIo2G/NAOSYV3Vhnwv/0YqfcjYJNEOoefMumzqWjosQZp6Uke9Ys1KJYDeq1etT3ngnMD+18hKNLlL2o1btRc0zOPgOndLPoOpTGYxPZHevh9LJH6dwfu/3TPb9CvApPLbIX/0ESCjo5o0gfLF91rAC+ky5KSAUJUd2WpJ/ANT8oDXOxW4eIrNknGOpM1HzuejMkWBZ+F1we/WaakNoconzxCG3rgW5xMjCz/aWVLa0HqbrHPWQ8DaEoCvKOFMaUAy6M+IlO2dBtBe3ClSvL7qxD9sKNzohiswMHu6hhhTnmw/xDS8BMTax8JL8yxIzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrVahVVDhzpPURDGPQg/y+2bkBWm5COR6Z4wXS5l8Hw=;
 b=EtpyJCG//XpUqJ3Vl5L8EfXs+fFmQIq1e0JEjhJi/bHTVqdHrSwbrYIV3574HWVxCT8Rck8iaGaA2flxCX/fjWx8aQyl6vUhfK2EDrKu3H/DRLBKu+X02au1n2mPEPFMHBGg+of46LIsybg+8EHnqTRiJUW41JveUgx1L/fxyGKq5hzjhjvmE6VcpWhtxzY/B7+XxpMEOYiV3UAqkmXsjPzmkinsryL4bslGSzBfcC2gyJWACaExDS/6atD0Q8SeYTZcDmAxBcqpbH1PuLNlSKnXsPA7GbwDnNK9yUwhis8TucJwERaPYXsCrRBhlPCq5p8naLvvEeClbZNdvavyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrVahVVDhzpPURDGPQg/y+2bkBWm5COR6Z4wXS5l8Hw=;
 b=u5RP0YDkESI0MZAd41LzHD680QiwIFgTzVyjqzsEFLYbTHl1tQvrcl7MBp4d0AJNGk4ojpyDcxnx8dFAbRgyEwvndQu6BoiyP/dwb77FPkTPslI0fYalJmGaCYLk2wyT7ft52atKt27YRSOt6NlKGYpcLEMdcX77FhHDdKxAx6A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3654.namprd12.prod.outlook.com (2603:10b6:610:22::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 19:34:58 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f5af:373a:5a75:c353]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f5af:373a:5a75:c353%8]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 19:34:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
 <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
Subject: Re: Moving QEMU downloads to GitLab Releases?
From: Michael Roth <michael.roth@amd.com>
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
To: Philippe Mathieu-Daudé <f4bug@amsat.org>, Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 04 Oct 2021 14:34:49 -0500
Message-ID: <163337608907.347510.4401699281486806089@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SA9PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:806:23::20) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
Received: from localhost (76.251.165.188) by
 SA9PR13CA0075.namprd13.prod.outlook.com (2603:10b6:806:23::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.8 via Frontend Transport; Mon, 4 Oct 2021 19:34:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0843da5c-3870-4c46-a3b9-08d9876e0cd6
X-MS-TrafficTypeDiagnostic: CH2PR12MB3654:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3654C480A6C1531D6CABF26D95AE9@CH2PR12MB3654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loDz11KCzewpVNXh0xahuqFnLMAbRlbheVCUp9Wg0BZo9/dbRdGuQ5P+XowqWVidvehzCcsKbIJqYFllN5lMknGqbRioWsWXYQr//gc+4QdmXhoQEsq3T4NJUJjx1qA4cpQgP2i6UrsmzYuUSPLsjjGCLCAb0EDkmtXn4Zo+h5UPIJ+j/FPqpKJbKN/cNrdbkpnjqO+6UUgfFp7zM0GHzCaqN0y4lCbFdmKaTsZ3dkhDfxOWsAZjbyx1N88Kjqt4jkDbKZdF+otXHHxSmnEdPAm5itt1uitSNZOO2LaxSvPhYj4JXJPe6b7Jub2LMhUQAUhLyT7fzj95Yd/XinQhQVtkVc+kHgA/2bJcq8z5RUBN279RQSkgckslsBqnEbu8OWjsBnC+GfppFKea2caxZfniAkRnCOOay0PN37ZgAmRlV2ca0DmNB5e1NLJFvkWIOQLB/q6dKLgUZTBvH3XqcuNfuIhIDyD9Lj7Jeqqnp+MLqN5fYBoU4ZoM1WFiYrRJwjFXx6baMCmlF9C1eNfQ/+sNlp4VYmmIE1C3wAoqkqpRyrM6BrItxmqMIYBBqjXlgyRSLhF9Tv3H+WcAcWnlxU/NX4CueZJqS4KQORXTLWxNl6WO2877VAhiUPD1JXDZbH1XYPSIvaZ5QdrO1PQ4447Pa0QgXZpfXMWu8D9zoekjOOzreiHwpGlm15rKWuZKJiqGsraqmVIJN8O5pYJH+uw2nvi+kaJ8A5WA8D6pIiIqHsGCxJXbN7jGxbPeF1toBl303f++8KjeCy3nbdNH/pGemJ6wHL7OlAizro8nf2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(66556008)(316002)(4326008)(83380400001)(44832011)(6666004)(8936002)(5660300002)(86362001)(2616005)(36756003)(8676002)(38100700002)(110136005)(38350700002)(186003)(66946007)(6496006)(966005)(53546011)(26005)(6486002)(66476007)(2906002)(508600001)(956004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnlGY0E3djFqc1BQQ004Rlg5WmJ0QzZ5UlkvM0JNazA5UFpyNVM3RmtUK01W?=
 =?utf-8?B?Wm5EUDJNWmxsZTVpVkFUT2N6eDA3SExiblBueTFJS3JhVmlUYTBQNkpPZjNy?=
 =?utf-8?B?akxpYkVVNUhuZEZuQjFzMjZRVUlPNTNFdFovWm1IdzhtblFleHpjVk1kemIx?=
 =?utf-8?B?eDY2RVZTUmh5Q01tRERXK2lzMFNPUmVjUXZLeGhRUTcrZDFFNFFwVGJqbEd6?=
 =?utf-8?B?SWI4VzZIYzhCUjdpcnhqbytyL3NOZUpQd04xY1pWclFlRWxxc083cUVWWmxs?=
 =?utf-8?B?L0NkbjQyWlR6NVhtcWZtbGwxZEdvVXE5citlNFlIcVgranVXYkJsT1ZvOERr?=
 =?utf-8?B?ZEZad2NiNEJjZC93WDVVVjY3cC9yalZBRWdvdWlRL25KbER1UU43SHlpWVNy?=
 =?utf-8?B?aFpza3RIWUcrSzk4emhsRFRMbXJ1WlExelFkOVNGc0drcGhPUmxFaG1xQ09S?=
 =?utf-8?B?UC93ayt6TGVrMTV2cnlZUmJyaWw1S0Ezak9zQUdHTjdCbUZLN3FocmpGbGxW?=
 =?utf-8?B?eHRpSHY4TDRLNGxmL3UxK2tWYms4MVVlZTlaM21GR0w1aXBUbTJEVzF0bVlh?=
 =?utf-8?B?VGNzSXB0OWlXNUdzOGc2UjlXelR5ZWFTYTltQmVtZDBCVW1MY1Zvd2o2NjVC?=
 =?utf-8?B?R1UrWWVDSFI0VkR0UDkxQVdvOTdQZFBOeGJPbXduUEZwUlU1aXg1MU9lanJt?=
 =?utf-8?B?cHBZTkpEZXM4cGxSeXdCWDRLSHR3ZEd0N1FqMlV3NVhMaDFMN0owVWJpeEhh?=
 =?utf-8?B?NXY3OGRJNkgvSjdHdS9weWxJMTFOUnBGUFl5UFIwQnEzcXh3VjJMdll0Wkhx?=
 =?utf-8?B?RjNIZmpNcWhJRDJYUTcwdmZERnNVOXV4bVZRajNQSEVmQTQ1eGNkcHVPQ2Q0?=
 =?utf-8?B?YkpOdGpTYytjS2FUU2ltc0pTTEMwY1hoUFBxOVpLczNtK0NmakM0OC94QmxY?=
 =?utf-8?B?QWNVNFB6Y2FETW4wNHg5SXkycnowRjNrQkJuSEZpc1Z4Z1hMTXZlRUVkMk1R?=
 =?utf-8?B?cWxkc2piN1ZkTnA4cmRQb0FKaVc3QTlGN1YxZEI5VGxpRHVlbWxxYlFDVUlp?=
 =?utf-8?B?bGhVM29QNlRMYWZWZjM0ZlI0V3ZLNjI5U1BBRzFOSnRrZThtek44MUNQLzZu?=
 =?utf-8?B?cC80ajZLc1cyMWhPbEZuWlJvMjJscDVYc1lTTlg3akVxam1rY0kybm1nV3lG?=
 =?utf-8?B?ZzNsYTFZeUNGWldKb0REcGFSZ0lZSVQ5TFVPZ1BLOFBseEJDWUZHVmVoSDQ4?=
 =?utf-8?B?b24vU3JCb1JNQlhLR0dmSldvTUJQMkpoYzFudTJOODlVbEQvNTE2b0pXd0xV?=
 =?utf-8?B?bzhCc0NGZ2dnZmtKYXNEQjNLVmJBOEZiV0RIdThTYlNrakplSWNHTHVqNkdR?=
 =?utf-8?B?YUk4VkNkQnhJZ0FaeTQzUlVmR3VCekxuaFpjdlBBZnE3YnZNU3hpNDllcWly?=
 =?utf-8?B?Nk5VQkRDVFE2SGJqNFVpK21LMkFyRmE1Wmg4TGtkU0g3ZUNnOEhWZ3Fjc3dV?=
 =?utf-8?B?a2VuVlFhbUIwOElzSk5kUWlhZzV2OHhBMHgwUkJiL0FRT0lLOHV4c2hlUmxQ?=
 =?utf-8?B?bmpKbTQvMGYyM3lBZjVtc0dobWNWQlp4YjRGYloxWW1iRStZTWJMejQ5Q0h6?=
 =?utf-8?B?OUIvRGdWdE9rdmsxQy9pUnJLQjFicGxCTmRyWUllY3liOURhUUgxekRSdnhz?=
 =?utf-8?B?WUpMMmlVT2VYalYraWc3cnhxZzlYYXZJdzRvekhTRk5UNTNONTFZRWU5Q3Mz?=
 =?utf-8?Q?IRC8kgQvMU+NZ3NPyagopoWXwqm59OrynwNxiAb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0843da5c-3870-4c46-a3b9-08d9876e0cd6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 19:34:58.3192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2rGpFeXZoZClH34IVrxPPzFn2RF/CquUk+V7YpAW3QtkjJHjZPWPEaCM7RQ7Az9yie7ZOjYbe5c3Nwl4NrQXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3654
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::626;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

Quoting Stefan Hajnoczi (2021-10-04 04:01:22)
> On Fri, Oct 01, 2021 at 09:39:13AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 9/30/21 15:40, Stefan Hajnoczi wrote:
> > > Hi Mike,
> > > QEMU downloads are currently hosted on qemu.org's Apache web server.
> > > Paolo and I were discussing ways to reduce qemu.org network traffic t=
o
> > > save money and eventually turn off the qemu.org server since there is=
 no
> > > full-time sysadmin for it. I'd like to discuss moving QEMU downloads =
to
> > > GitLab Releases.
> > >=20
> > > Since you create and sign QEMU releases I wanted to see what you thin=
k
> > > about the idea. GitLab Releases has two ways of creating release asse=
ts:
> > > archiving a git tree and attaching arbitrary binaries. The
> > > scripts/make-release script fetches submodules and generates version
> > > files, so it may be necessary to treat QEMU tarballs as arbitrary
> > > binaries instead of simply letting GitLab create git tree archives:
> > > https://docs.gitlab.com/ee/user/project/releases/#use-a-generic-packa=
ge-for-attaching-binaries
> > >=20
> > > Releases can be uploaded via the GitLab API from your local machine o=
r
> > > deployed as a GitLab CI job. Uploading from your local machine would =
be
> > > the closest to the current workflow.
> > >=20
> > > In the long term we could have a CI job that automatically publishes
> > > QEMU releases when a new qemu.git tag is pushed. The release process
> > > could be fully automated so that manual steps are no longer necessary=
,
> > > although we'd have to trust GitLab with QEMU GPG signing keys.
> >=20
> > Before having to trust a SaaS for GPG signing, could this work?
> >=20
> > - make-release script should produce a reproducible tarball in a
> >   gitlab job, along with a file containing the tarball hash.
> >=20
> > - Mike (or whoever is responsible of releases) keeps doing a local
> >   manual build
> >=20
> > - Mike checks the local hash matches the Gitlab artifact hash
> >=20
> > - Mike signs its local build/hash and uses the GitLab API to upload
> >   that .sig to job artifacts
> >=20
> > - we can have an extra manual job that checks the tarball.sig
> >   (hash and pubkey) and on success deploys updating the download
> >   page, adding the new release
>=20
> I wonder what Mike sees as the way forward.

Hi Stefan, Philippe,

In general I like the idea, since we could also have the CI do the full
gamut of testing against the binaries built from said tarball, so the
Release Person can just regenerate the tarball and provide a sig to
attest that it came from the proper sources. Currently I do make check
and make check-acceptance and a few other sanity checks, which I guess
would no longer be needed then.

But I think the more immediate issue is where/how to host those
tarballs. Even moving all the ROMs/capstone out of the source tree still
results in an xz-compressed tarball size ~25MB, which is well above the
10MB limit mentioned earlier. We could break it out into target-specific
tarballs, maybe further into softmmu/user variants, but that sounds
painful for both users and maintainers who need to deal with the
resulting source tree differences.

What I'm wondering is whether we could just use the archive files
generated by gitlab when we tag our releases? E.g.:

  https://gitlab.com/qemu-project/qemu/-/archive/v6.1.0/qemu-v6.1.0.tar.bz2

If we paired that with an in-tree script similar to make-release for
users to download individual ROM sources/subprojects used for a particular
tagged release, would that be sufficient for GPL compliance and verifying
what sources the binaries were built from? Are there any other
considerations WRT ROMs/etc.?

With something like that in place, Release Person could just do a git
checkout, verify the Maintainer's sig/tag (in case we don't necessarily
trust the git host), generate the tarball, verify the hash matches what
gitlab published (or verify/diff individual files if the bz/gz hashes
require a specific environment), then sign the gitlab tarball and add
the sig to qemu.org download page along with a link the gitlab-generated
tarball.

We could also publish the Maintainer and Release Person public keys on
qemu.org download page so users can verify this as well using the same
process.

Users that want the additional sources can then do it locally via
above-mentioned script, which would be part of the now-signed tarball
and so could be 'trusted' assuming the individual project hosts weren't
compromised (which is still an assumption that's needed with the current
process anyway).

I guess the main question is who is using the ROM/BIOS sources in the
tarballs, and would this 2-step process work for those users? If there
are distros relying on them then maybe there are some more logistics to
consider since the make-release downloads are both time-consuming and
prone to network errors/stalls since it relies on the availability of a
good number of different hosts.

-Mike

>=20
> Stefan

