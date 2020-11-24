Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B22C21E2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:42:58 +0100 (CET)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUqf-0001az-Bt
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khUnp-0000pC-TK; Tue, 24 Nov 2020 04:40:02 -0500
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:9853 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khUnm-0002yZ-P1; Tue, 24 Nov 2020 04:40:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDGVPccxyLZ4J8fW3/CEnDXYJfLlTclJOnE+nX00G6ul+GOfgASPTlyVfYN060G/4dr4pwozBXYX7QKs4A4sX8UpRbM2uB3Dh6bfGBczNvijcxgEMvSzmgDAH3CT0hfJwCE7Fu9fvJp83OvmWx3NQvMQqXYf5U5wSNv8sNEf/QTnQPQj+2RWzk5CAlfWPw3ZnXd8YCmZnYfZ7TmuNe8TKL2kybIAinUrryfEd5IKv1a9FB7d51nOJZMV1r955GHDLIfLbmeGkURcmlEaMWT8/diqxL2uVEuC9oMvCaffZD+0Bh7mbJU9Y6/eY0VATT8JMHtBl5XBTpD2e7udOp7oQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7E8tw81tt+AYZ531S++cLKritENuBXMrxjqAykoIAw=;
 b=F+cZiSUMrC+B7UwZ/BKCiD75fT3XqGCa/uiCTed9jJmYu99AHSD/4t0nSrxEM2WDMOko05iy9Rrw//v9OqL25FTxheNKKVNm94Ix4i1R4a87cQ5WL+wyO+Th3bEpppMUon6AbTVZVxRXL+vYW1dUAHJnLcWuesvjLV/SbShMBHCYZhmZLF/DWU5GCyS9OrnyA1HSmQGDcJrTB8b65tXa9RZtS8KRsYYcMXGaFAdT6Z4MRmmYj4DQcH8PFeFm4QY8Dq+HKTLKO2OlxpGr1xtV1dHC796hhN0V/NcKlO9UQgOAgeDbInSN9l/0ibZgleUu2gmKCQgD0Oq9oCCb7j0qIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7E8tw81tt+AYZ531S++cLKritENuBXMrxjqAykoIAw=;
 b=ev0tXi63tHEs82F8wbdyDrpsVBQoKuiw8rVJajNvvH9pRCXsFhIyvSFFEkEQRbJCfcRQIhh8qZLhprcYIRXuQ2z1hkXZB5w4N49zk+iI5wdHSR+JWmpNR0Xp6FBJis0E4xiUL+yWd6q7M0g+gVa/+dPvXVpGy5NTEoD86S2lnjM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Tue, 24 Nov
 2020 09:39:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:39:53 +0000
Subject: Re: [PATCH 1/2] block: make bdrv_drop_intermediate() less wrong
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
 <20201123201233.9534-2-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2a272dc2-3fc6-368f-11ee-e126b448f13e@virtuozzo.com>
Date: Tue, 24 Nov 2020 12:39:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201123201233.9534-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR02CA0084.eurprd02.prod.outlook.com
 (2603:10a6:208:154::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.100) by
 AM0PR02CA0084.eurprd02.prod.outlook.com (2603:10a6:208:154::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:39:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2bda6ee-f73a-45de-ff30-08d8905ce596
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951272683C8D17507B2583FC1FB0@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ciSyM71/EBdSGAQk0vFHp+jYqxXkOSQ3EqGD7kPwoJHQHi1aHcOsJYG/R1s9oLo95vd7K2Quid+dATF1fRNvpKsgcKhyJfn4AYJRqAnxw4EqAcoVSY7ldsrmomklXdYtmr668sSPm2HdUNzZ3I87SRVoQNoycExLS2I+mhe/XMXlcm4f4BASHT7VjEnGiZORmtiqmkzPJL7ByrEqxQJcX2kpOg2aUotBzxi7P+XfQ2lFgVdgDeyKsJwRzE0fqRkVNv2tb/JJg2jEDmxror14Skzoly/Cy5BOdCVR5+0z9JLCoj2p0EVI3PDu2wg8FVWh7o0cErREaRKTUhH0XzYbdnpECMPkJvphxE9Xm5ui1YrmjqpQRsvn5bwT435EBPi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(136003)(346002)(366004)(2906002)(83380400001)(2616005)(52116002)(36756003)(5660300002)(6486002)(86362001)(31686004)(66556008)(26005)(956004)(66476007)(66946007)(4326008)(316002)(16576012)(31696002)(6916009)(107886003)(186003)(478600001)(16526019)(8676002)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 4ckRjKSC25c8GcygCsDe6Io6q1K7Hwwm7P4UmDAs93tbLJQldiIQ/wuxndDi1ECG1fe+1ZSUIxfzPM/E7GhJ5XpFjH1NgTOUt7eB18AoBlwjBW7MHaUBUASulTmRq9bqfrykP/sT6WqZoP4IsvfZdg3Fru5SG/R8Adhhf1hU/VviJJDz6FNH7/2zB6foRuriES6+V72g9Xm09+/MQFFel9wJENCBP81lXkcLZB8ysISuxiVl5Ol5OwTY8RpW8xXqFYczu6h1w6B/sdHUs82vKgBUY6vOfYqAW5fDyX2m18NUiSZ6eQH7WfPKmNLk/Tb5m4OiTTLcG6eDvadt7+WQsGBJQrsXxB7V/ZsI7csyCXyLcO6TSPMfOAo/1A61Cxj4gdA0CxH6U7zcoO/e/Z7yc8U5MgcqT3af0V1P0e377Se8y+lpXE1HUpAWqVRvF1KwSaoXAX4xvpsxuhcAM2sOd+CLGx71DMnfb2Du7HDRhCeH7PI159S9+RftLgVJbRTdnN1vh1IjOnNZ37V0mz/SwrKf1t0pEOqiEW3nJB8ujOqJYf7NPb55rTrkpmmxiQDmiXIn9QNVPVXR1BezxLDbmjvD7ku9H3LgvEp+9OWF3dQiICkt/ceHsHG08ybUqmaGzgjwwDmo0+nCGQRtZPR7wVjpM5mb5h8HEkrGfaiKENQ6PBDXA0o6waIKVYhf779ipceFyh+MM5SPzjCGd7RqK3+K3q60GjNv8dCSef3TS3JIkzdXyPBj0bIYUxYgPR+QafOcmWro+N7/j+ZsFbvBGRVU8W+mfYPGjo76dqD3y7AuyC3WdEeoAXQuYKvyym+Bg2e1VKXoBwG/bt8fXZhTqpPdVfcD5iU5kMpdNH0A2mT2hJW8ffMxiKwq35l937YwZPIEAAmJTLtn/88k4ilCew==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bda6ee-f73a-45de-ff30-08d8905ce596
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 09:39:53.8225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5y3baBHMYlrQo/Rg8Nr6j6pPq98xAlqgJOKIQNwWyMpFxsQlRhbVp1pXaRoNZ33lzLev+wCYpGXZialIcP0NttRh6/uBFai2PlInqdsmM8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

23.11.2020 23:12, Vladimir Sementsov-Ogievskiy wrote:
> First, permission update loop tries to do iterations transactionally,
> but the whole update is not transactional: nobody roll-back successful
> loop iterations when some iteration fails.
> 
> Second, in the iteration we have nested permission update:
> c->klass->update_filename may point to bdrv_child_cb_update_filename()
> which calls bdrv_backing_update_filename(), which may do node reopen to
> RW.
> 
> Permission update system is not prepared to nested updates, at least it
> has intermediate permission-update state stored in BdrvChild
> structures: has_backup_perm, backup_perm and backup_shared_perm.
> 
> So, let's first do bdrv_replace_node() (which is more transactional
> than open-coded update in bdrv_drop_intermediate()) and then call
> update_filename() in separate. We still do not rollback changes in case
> of update_filename() failure but it's not much worse than pre-patch
> behavior.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

this is accidental patch, ignore it

-- 
Best regards,
Vladimir

