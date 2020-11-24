Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E8B2C21E3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:44:14 +0100 (CET)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUrt-00036n-IY
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khUqf-00020q-4Y; Tue, 24 Nov 2020 04:42:57 -0500
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:14369 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khUqb-0003za-0l; Tue, 24 Nov 2020 04:42:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRHL5TKyjdsHGthiMHU/MBOlWkfz0dA/rHOxWgXuddQkRTBbDZkuA+ITKVM8icuCc08OW3AdoBtApBLeMcxbOVxBC+aV93U1PY/kxZWWUwLO/JKAPKB2TadWr8llwRxcq2zR1d7hyZzkTqPh0zVEnwT1oD09vfXurZ1J32Afv6tmhTH2cEMMcnqXk0sLbEq9DLgqRa+JdYrRYtKVuk1SiaJK9Pz9gsGlJeDvNcvUeI4I8zPmSOQ6CehIpUVv6yk0A8w3Zpu3ujeqGQ6EiX40q4XlMeAkfK1IGnk7PE5Lu4kS9LvG8hV9/OUcveB5jFTe/epv62KKiFeKyWHkPxfg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6y5SsM8gELT+M3hpXn+bvr63AR+Y3ESOQNl8ZhvcFI=;
 b=gct8b4fkBSp1MV7RLpz6hWa/7XQwFhtNXmRVpZK9ot1IJXI7e/k0eVOGjW0QGyPWYM385BZEu8qwbrr+3WuocQYvA1B/259qcbiRWe93puAGJjtWnn7qpQoZ6A7BbnVuKY2qAEFOHVO8PrVDgQXbiUSG8WGBInK15RvlCocymX8qFxhY0L0eZGCZg1xeUiGpHsSl/WyNrxSDvNQLeR20XeSKHJEgtxz3HzTR/fSFR4ZmLn5kQDlaZLMGq3PbsBP4ySblTISC7iB8YoGVnTQmG+Gw1YShkglSu69njov1BKdp1p3AZae74wHg7UmpH3BFwTwEfLpOolskqfwQtwg5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6y5SsM8gELT+M3hpXn+bvr63AR+Y3ESOQNl8ZhvcFI=;
 b=Zy0I4KfHCkN9f0Ja3tJEyiVp+y+qfM+7UO0XhU4o5XjiQUFRmVrE3pXbWjsuxIQkO09C11dvwI2PHVFUSF1JqBapjL7cwKI+VUHfomILkL9Xx9GNUn9DA1ew6BfbS/sGt14j58o/jkbD7+jJHulAYiRBl2lI9gUIMtykgCSezwA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 09:42:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:42:48 +0000
Subject: Re: [PATCH 04/21] block: bdrv_refresh_perms: check parents compliance
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
 <20201123201233.9534-7-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <97ec2117-470e-aac6-7861-903c97e91b97@virtuozzo.com>
Date: Tue, 24 Nov 2020 12:42:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201123201233.9534-7-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM8P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.100) by
 AM8P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 09:42:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 813a7743-7329-43c0-21a6-08d8905d4dd2
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990AE0FC0027B0A07A275D4C1FB0@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:166;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47T6TylnSbMLGe4pKdKUEvsAg4PPevg09BDW6GUnbobUvBE7t1VfM2YQFkZgtJMnmLuCTfsrBPDM2SrQaeN7rD2Py4Os7hD1veJ6E5iJkq49xWSFyCAdfeSitZKsL/Mx57zXgPpjqfvgFRqRbgSkTfXIqhwkkYe3TBda2xJrlc2S/Ihqof9OxGXxl4qyn5IrZ2gKaOhVevygZhIQkgdUHydiPGUajnou3RVfU3r47P8JGoxx3yyAiWcqMoGjG1kvAAFMdn+eMbfHcjAgbIkiFT6PggDJbIvcXuq/ltHdW1OtIyNT1bPLJc+Ky63vAkzSO1VnPDb2VydsOmy6eybOnZYSawYkyqOkvSCcjF3IGVaTFplzxhAfD97J64avBMGK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(26005)(83380400001)(16576012)(8936002)(316002)(31686004)(52116002)(66476007)(66556008)(2616005)(186003)(2906002)(6916009)(4326008)(956004)(66946007)(107886003)(5660300002)(16526019)(86362001)(36756003)(31696002)(478600001)(6486002)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: S2mbBwbZzMXpeOlSQK5lJJ5QdhvSYo+8cV//csU7Nv8WKvdxzLvIZzwezU5bU85KllPYJreB3V3TYqeD5fOgv7lN0EXL7v3X1xDMfZmOI+T+1r24EF6MBdWaV1tcA3BAd+/TkJ1pmYEI08OE24vdrYIWQ7OphQX+lVE79kp82oatBBkQJfKZavF0TBmdvQNRuHe0tIdzLJLG1HZICSuUSVy+SBD/XvRrOgejD2CYGWaKTl8IBY4MQaiQ6neAOOrsofU4OFGY7lCPgiTndCAt1hlA8RiM+zsShilfb0gu1eBCZiVwFWkNPTyEt/Fhxocw9q8X+zSPjNLfhpTWMw+Lq+AFAdp2ZybZTcwe2TjRMh1VP56bYuvKiSBGghZJjyjacEPPrlmQvj5QabcgRHjqMFOFl/DYR27owMjjnK7OjUMGlm07HOgnVdHfIO3tFwZSQtKorp8efYnXPDVclsjar2Y36Zr2EWKa7NsbT69JUw5uHPgFQuXArDx2OU1g3rtXNjogV1MtKUWDIBgFXfhUKVl5VIZT1MUFa8tMywIH+28L+z/dZ60+/5kjTxZf7Bbje+XxMcCLgKV/3rEdQgAbw/fWPKX1+oqKO6H4P13MBMJeVmCk35Ub1HDXT2iAjIdGHMZ4dR4Mjm9bMuelDnQWWauuywIS6rqgXQDwqUzJUzbFwlA9KwbrzUvGwDFxPShvhzp9pMqly0zwpICekzpGbotD4D7tilAWFFGo8HRVvaErQfBuHKtloBAGeDKpjWDMK5ALG/VkwWByF+wYyEVfyzYIU1TyQ3tpa/9qpu9N090FWwLIp65bb/mvUgfxCWQeQFjThcsgMDVjE56trv+yRb1dCT+jlYM0wXa0CJDj50dfZcFJJzEz7vKD/tuLsI1op+uEcs0DgDe1EPKS4IrPQw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813a7743-7329-43c0-21a6-08d8905d4dd2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 09:42:48.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67NoAX4XnhNQdZYiVtIXFdpwwVgBDCebPBEwwp1IYcul3xK9P/aI+sb+UOzmpfU5ep8d2ASP+8D/gT0XI7XKogIWXFDDW5ylaJymnASk5No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.21.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
> Add additional check that node parents do not interfere with each
> other. This should not hurt existing callers and allows in further
> patch use bdrv_refresh_perms() to update a subtree of changed
> BdrvChild (check that change is correct).
> 
> New check will substitute bdrv_check_update_perm() in following
> permissions refactoring, so keep error messages the same to avoid
> unit test result changes.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 0dd28f0902..0d0f065db4 100644
> --- a/block.c
> +++ b/block.c
> @@ -1945,6 +1945,56 @@ bool bdrv_is_writable(BlockDriverState *bs)
>       return bdrv_is_writable_after_reopen(bs, NULL);
>   }
>   
> +static char *bdrv_child_user_desc(BdrvChild *c)
> +{
> +    if (c->klass->get_parent_desc) {
> +        return c->klass->get_parent_desc(c);
> +    }
> +
> +    return g_strdup("another user");
> +}
> +
> +static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
> +{
> +    g_autofree char *user = NULL;
> +    g_autofree char *perm_names = NULL;
> +
> +    if ((b->perm & a->shared_perm) == b->perm) {
> +        return true;
> +    }
> +
> +    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
> +    user = bdrv_child_user_desc(a);
> +    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
> +               "allow '%s' on %s",
> +               user, a->name, perm_names, bdrv_get_node_name(b->bs));
> +
> +    return false;
> +}
> +
> +static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
> +{
> +    BdrvChild *a, *b;
> +
> +    QLIST_FOREACH(a, &bs->parents, next_parent) {
> +        QLIST_FOREACH(b, &bs->parents, next_parent) {
> +            if (a == b) {
> +                continue;
> +            }
> +
> +            if (!bdrv_a_allow_b(a, b, errp)) {
> +                return false;
> +            }
> +
> +            if (!bdrv_a_allow_b(b, a, errp)) {
> +                return false;
> +            }

drop this if. We look at each pair twice anyway.

-- 
Best regards,
Vladimir

