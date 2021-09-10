Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1504069F4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:19:05 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdce-00066l-Ew
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOdbo-0005SH-Qi
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:18:12 -0400
Received: from mail-co1nam11on2077.outbound.protection.outlook.com
 ([40.107.220.77]:48737 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOdbl-0001eS-Nc
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:18:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkBET9bJRwcOCkqqUTZd246ldmuhV5VgknX6YYGG7NcD4MX8LLpJnDzeNImIwvCQ8hEVilJ1HsgQyy8ZCcFJi4/izl8krKmKYuBBa7zr3hwtvFJx++slhN9KDY3CFtptPV1xmUKqH1qFjG4gtLYH3BZ6BEA9jiNXBX5DPspNZKlaxkvZeWNxpxPQg8UisqHeUqprSY+iW7PSp7S61jjjoWUrmxKPA1Pv/0jz95PpSuChQTqupDamtpITr5ZxXHsfCghFmUgV16qoccsC2Gh8M16PSOQxT4Bv4QGUtimGHKgyevi+c+aQ6Veqj5ZKhYTQONlnVd6rMc1zlSO4NuUhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Cb22/W8MJgXkAVHYuVjdBZO/2BNODvTO2Rm24IeDcvI=;
 b=kcD8BKf79qytK/s4ZVEoRVMbmoG3QGARCfGpKVV/vn3N549gM77grt0Y8fcoWzu/QPAaDMiyIVA7dR1xcfzxNDh9cnbH/w2tbcnqCxjWyGOrDbNDxKAzxmhMsVpP9wYb4Jk6NyZZGLFjEUfeZm0mmZHGrSSnhjbnu65xft+/6fMxuv8nlDWV+COldkvx8QThRcuLg0a56VZ5iPz2wh5NCvl42z44W+Jl0af+I9KoN9MU6tX4UuDFrQ3mv+fun9v1VpmpSVA/JF7akpM7WTVH5OK8jLUwsxLUSV4R1Qcv9phI5+Il8k22Ev2O6N7hAD7hGPXkpHmPkQ2W1tcN/t8SXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb22/W8MJgXkAVHYuVjdBZO/2BNODvTO2Rm24IeDcvI=;
 b=DISYWcxTVI8YfTdyuSjy1jtg++Qvp2BAcVy2jUKpd7AHlyfJiYSv7xFwF21qidR0NnYL/Ck72w9Noj3qfzrPMh4nkvsLlKgLJnoNh7fng8v7KZFscUoc00C9eKquJUdlfaAg4mPgdimIhJQOGINIoAvlrgg73V69emm43MlcNaU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 10:18:05 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4478.026; Fri, 10 Sep 2021
 10:18:05 +0000
Date: Fri, 10 Sep 2021 10:18:03 +0000
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, Thomas.Lendacky@amd.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, ehabkost@redhat.com,
 dovmurik@linux.vnet.ibm.com, tobin@ibm.com, jejb@linux.ibm.com
Subject: Re: [PATCH v4 13/14] migration: for SEV live migration bump downtime
 limit to 1s.
Message-ID: <20210910101803.GD2686@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <b1468803a2200c3b5e1f1434eb74302ec4b824c6.1628076205.git.ashish.kalra@amd.com>
 <YTso1rziufm6Fi+j@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTso1rziufm6Fi+j@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SA0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:806:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 10:18:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69cdd763-1379-467a-368e-08d974444768
X-MS-TrafficTypeDiagnostic: SA0PR12MB4382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB438245CF24EB6DD32EAA2FD68ED69@SA0PR12MB4382.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgZt+1FTyZhVZor/xF5fwWITElcGfLSU48l/UNU7YlfhZfyhHMk7BaJKHbLkBOUBkOy6gkKDRRtqlWbI6XA9hpz14xUx6V+5PNrW03lb+GmTP4O0OuUdh10sUYH8GOY1MToTFfDU2e2S6VO0t27FKpZZImsNOC987HngjJcWm4ntxGTZRDenwp1RUp2PkF8XzXifTWo0ICeGqBFf3sA4dx/6KB9X1g9f/a3LAI1G4M61Ztq56cGG2o+Y3Xdd2ZRI4M1h2xb6Vt4BZNxAeLF/20tuvoEbaDk5crejshzUEBtDBYhLueIMw+FEDVNk2lH8WcQFLJoVkF2UOisSCni9tpa8JY0YlzAAGXlqd8KH5+ySNMinhr4RWm3B/FU/blUkbi9xaG14BW0/b5DSCqQgrgRdWjH00oM9l69u+ICWB84GcYjEmbulDWTOQcjjD/7tF4RJQcWxyW5edIPRSeh815maIwgCrtwddx/7J59yC7PhBMKWEj177Rvt3nelghJVUP9UisjKy+RyMrH+lKb1ysIBv+TUiv7RS6SszLDG+KgXb/2uTiyaojK+bbQNT0icsdLiyY4GhcCwyVxAAKTuqCHdsPdJAjj4XqJDOP3nqBYBQ5VWZeTUQheNJJmrps+8lgWXfmlcUqHZ3MyXFZV1hvClU1hfkXdAKkwMgrZNIxXxTXBVXSFJ0FnE2sA90RYoJPvT1cMVHisUXS7YxHyEqU2tMUzuvLoULLG6ICcwoQr/yKd9YkHtKdVZOCKogmsgOyYG1I6T8yF1R10RKN/wKxVxG9mIa43+KotfBcRMtRwTqeMEGtO2rZQh9ZduCHRG3YQOlIKsrrIff7wXrZkP2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(45080400002)(8936002)(1076003)(83380400001)(966005)(33656002)(66476007)(316002)(6496006)(508600001)(66946007)(55016002)(5660300002)(9686003)(8676002)(66556008)(86362001)(38350700002)(186003)(2906002)(44832011)(6916009)(26005)(52116002)(33716001)(956004)(4326008)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bG34FgpifQZTYgSjZa+Mt1TNPFESettb7O4fgF1mljtdWib7EhWmwkSLmP?=
 =?iso-8859-1?Q?jZKyfHm4YicRUOmFUgAUJKq0hU6Oz2oxjD5ZfSajNg6zzKzYAYh74HE218?=
 =?iso-8859-1?Q?okBph6snAknl/cHDNsybcrt4IJ8c8RYI8kH5cIpgwa6jelOngqkjdpCDJD?=
 =?iso-8859-1?Q?d50wrc9eTzieTbfrckvx0OVxpvYnySpmRsP7KgJ4UXv0wMe/4wHFHSoZdn?=
 =?iso-8859-1?Q?srl413kMifMIQAkxdHI3CjTWmIsKtmqKa8iiJptPmgexcUz3lBX2wK5g3M?=
 =?iso-8859-1?Q?x7/4j0iO5WG/XQArKWD9dvPthCDMFJnlUsJ0GcXT+9gwuvJn1wAzqyxCn2?=
 =?iso-8859-1?Q?0I+4o5On7iPnSzjDQkCTSeGbpXS1iY40ksVB+57b4JZM5jWeEFiTMAnvN4?=
 =?iso-8859-1?Q?dVVRm0T2Gf8Hk+/QCi9arip8VIeqDSCXCsWzDNqdfy7TdEsIOFxe8dBWRE?=
 =?iso-8859-1?Q?u85B66fliUyMQ/w+Qou2eParap4WD+MI6AK0m4AXCHOh//l31GitClSLVf?=
 =?iso-8859-1?Q?9ZovCyQk9/uCiOy01i46pj3vX+z0aLDiNDqNmFe+sHz/A3b0UnMfRz0eip?=
 =?iso-8859-1?Q?5pT7KDFtU+qr/v5ozI10dylaSe/bKo3oO96ejpFEdXm+VpjbditU+nWuIp?=
 =?iso-8859-1?Q?M54nrCN7AgqYTzSX3k3QBbqTTVmDA/5k8B0pmU7/B0Lput35aM8n0D2DEx?=
 =?iso-8859-1?Q?N85a835elzQ9VtA5dERfuchUst26GrwP0ZFeZjclYXiFbrbYqgWrLSTLIe?=
 =?iso-8859-1?Q?fekppNI2HKAkNvugNDXOZ0LIKP4769Er6oyz5Eg9tWWkf0wYnWmnoaN3b4?=
 =?iso-8859-1?Q?jz/JdT2gGtZuy2UT9tzd2d/ATyuRMArYzNdwuzyxAXuB02cNMaPV9RY34s?=
 =?iso-8859-1?Q?qTn5dSqyOr18K0t98V0g0lahYBItfBcJjH3KL8yjZgzuZqQHWvNDG41DRo?=
 =?iso-8859-1?Q?7gybZIr+tm+BywRi6GsdwVTA1erhBc8Cx3tsMGDWmMS6tRvlZSCIRDOh6h?=
 =?iso-8859-1?Q?tkst/hMNFgy8CI6PpgJ5pgarKSXvDdon7yvhTN6PBMgLo5jA43+S6nkq84?=
 =?iso-8859-1?Q?qULXbRHuH6BCOAGXroyTfDeqUu2Jcf1COIdispsYmxyOuKbvt1zlZ6OiSs?=
 =?iso-8859-1?Q?QUCiL1pOoOTfaDfbnQMf/XHfS+IN9Lsq8KqymMFylO3gYFReFhel5/kLuQ?=
 =?iso-8859-1?Q?3JK6H0SGNDLH1rb5QpQtKzCSEgTVdGomD4JNab19d00AD2ct7lcjDauqkX?=
 =?iso-8859-1?Q?eFTq9pC+U5cfEy36X5KL0xgKxK8tWIB8NdKjgW3cF1SexTkfp6EjZi2LwM?=
 =?iso-8859-1?Q?t5WvkWMjplVLGf2Xicq/BUvUbobRwTlXPHOhnwEf2cZoy+XKhaDfIEuRj8?=
 =?iso-8859-1?Q?YH3txFo7MT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cdd763-1379-467a-368e-08d974444768
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 10:18:05.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFUFRcgn1vBiuS+hUkiSPTZNmGdBDleT6WE/yIp4k5JiaS3NRIPZKJUq09Ln7yPnckE9uRck/IJTO29NjC18Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
Received-SPF: softfail client-ip=40.107.220.77;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Ashish Kalra <ashish.kalra@amd.com>
From:  Ashish Kalra via <qemu-devel@nongnu.org>

On Fri, Sep 10, 2021 at 10:43:50AM +0100, Daniel P. Berrangé wrote:
> On Wed, Aug 04, 2021 at 11:59:47AM +0000, Ashish Kalra wrote:
> > From: Ashish Kalra <ashish.kalra@amd.com>
> > 
> > Now, qemu has a default expected downtime of 300 ms and
> > SEV Live migration has a page-per-second bandwidth of 350-450 pages
> > ( SEV Live migration being generally slow due to guest RAM pages
> > being migrated after encryption using the security processor ).
> > With this expected downtime of 300ms and 350-450 pps bandwith,
> > the threshold size = <1/3 of the PPS bandwidth = ~100 pages.
> > 
> > Now, this threshold size is the maximum pages/bytes that can be
> > sent in the final completion phase of Live migration
> > (where the source VM is stopped) with the expected downtime.
> > Therefore, with the threshold size computed above,
> > the migration completion phase which halts the source VM
> > and then transfers the leftover dirty pages,
> > is only reached in SEV live migration case when # of dirty pages are ~100.
> > 
> > The dirty-pages-rate with larger guest RAM configuration like 4G, 8G, etc.
> > is much higher, typically in the range of 300-400+ pages, hence,
> > we always remain in the "dirty-sync" phase of migration and never
> > reach the migration completion phase with above guest RAM configs.
> > 
> > To summarize, with larger guest RAM configs,
> > the dirty-pages-rate > threshold_size (with the default qemu expected downtime of 300ms).
> > 
> > So, the fix is to increase qemu's expected downtime.
> > 
> > This is a tweakable parameter which can be set using "migrate_set_downtime".
> > 
> > With a downtime of 1 second, we get a threshold size of ~350-450 pages,
> > which will handle the "dirty-pages-rate" of 300+ pages and complete
> > the migration process, so we bump the default downtime to 1s in case
> > of SEV live migration being active.
> > 
> > Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> > ---
> >  migration/migration.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index daea3ecd04..c9bc33fb10 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -3568,6 +3568,10 @@ static void migration_update_counters(MigrationState *s,
> >      transferred = current_bytes - s->iteration_initial_bytes;
> >      time_spent = current_time - s->iteration_start_time;
> >      bandwidth = (double)transferred / time_spent;
> > +    if (memcrypt_enabled() &&
> > +        s->parameters.downtime_limit < 1000) {
> > +        s->parameters.downtime_limit = 1000;
> > +    }
> 
> I don't think we can be silently changing a value set by the mgmt
> app. If the app requests 300 ms downtime, then we *must* honour
> that, because it is driven by the SLA they need to privide to the
> guest user's workload. If it means the migration won't complete,
> it is up to the app to deal with that in some manner.
> 
> At most I think this is a documentation task to give guidance to
> mgmt apps about what special SEV-only things to consider whe tuning
> live migration.
> 

Yes, this makes sense to add this as part of SEV live migration
documentation. Also this is a tuneable parameter with
migrate-set-parameters, so this can be configured or adjusted
accordingly. 

Thanks,
Ashish

> -- 
> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fberrange.com%2F&amp;data=04%7C01%7Cashish.kalra%40amd.com%7C475027a3a7554e0f139f08d9743f8a2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637668638521013586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tUfEk6CEPwP79VRX%2BAQ4FAm7JgwKDfOv9cgGmETgsQk%3D&amp;reserved=0      -o-    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.flickr.com%2Fphotos%2Fdberrange&amp;data=04%7C01%7Cashish.kalra%40amd.com%7C475027a3a7554e0f139f08d9743f8a2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637668638521013586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=WHR%2FMZo4c3MZ0IWkZalvwP3V53fV9Grc6VqA%2FGxCo4s%3D&amp;reserved=0 :|
> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flibvirt.org%2F&amp;data=04%7C01%7Cashish.kalra%40amd.com%7C475027a3a7554e0f139f08d9743f8a2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637668638521013586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=K7c0HWjylWIf9joMj7IqGUEoFA%2BWpOq6EeYgsCgP5XA%3D&amp;reserved=0         -o-            https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Ffstop138.berrange.com%2F&amp;data=04%7C01%7Cashish.kalra%40amd.com%7C475027a3a7554e0f139f08d9743f8a2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637668638521013586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=n%2BTiLz2WHORv07TEjTGDA2JIKjfmJ0WuNR7CbXzdA8c%3D&amp;reserved=0 :|
> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fentangle-photo.org%2F&amp;data=04%7C01%7Cashish.kalra%40amd.com%7C475027a3a7554e0f139f08d9743f8a2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637668638521013586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=v5yyZXY6XH4TBle7oXCPSVy85PX1INJgrwIlW40Gydg%3D&amp;reserved=0    -o-    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.instagram.com%2Fdberrange&amp;data=04%7C01%7Cashish.kalra%40amd.com%7C475027a3a7554e0f139f08d9743f8a2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637668638521013586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=biI3OcZyTZe7Gfn8RrWM1tGImANHmJeaYeSNel0rzg4%3D&amp;reserved=0 :|
> 

