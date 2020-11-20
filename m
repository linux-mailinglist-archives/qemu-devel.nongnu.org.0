Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D422BB0AB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:37:53 +0100 (CET)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Q0-0002UK-Ae
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg9NT-0001Dn-4C; Fri, 20 Nov 2020 11:35:16 -0500
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:45184 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg9NO-0007vz-Rl; Fri, 20 Nov 2020 11:35:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDbcuiJfM3YUd4GfBeZrAoLm/C58MS5NouYzPP23C4d6ux0MeVJXLODkr+gWGcqZ8nKxIgGRVFhLGv0iYBgY0yqfW8C5Gd+6vvPLIdJ0AywxzUjZ2XqRNYFdc5chIEU+nhv5uqCMGzRZbX4pOXJb3G4XL2lqsBm17mVgg7JROauqK6YXyzGhXo9A58BcnQFfY1Jtx5hXxQBWnZ09lr5OyoOBgJK8M79QLAP3b3RBo+zfV41vq4D27kWtvHQwOfhjar1Cm8elczmUU5Bzs15YUqudXOqAaTKX1U3a4r5c4Ykc0kmmUk6giih2S2+K1jn++un4F2OuoNGv25Wfp0s9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwb40MMhU4OqdsHzAZOsCk90aI+WPv1Km4pmNgcYxtE=;
 b=as3te1rtG2PaZPj5IdIwM8ZixajKEt4yO4mkfLnT9VxE4CMNZ4H1lfGlZ904arzCUS1eVBPUMxBUGYV7cyzO9Nesq3R3zYafSjxNIzF/hUBOUMq7bW9lS8trpTcXucFyg77YHp+qksEx9TQNg3DPf0hFAbpAmuehVbC15tpqmpIV2JZwV+YUb1cRkS3wUpnMCm87IucM+9UQJxdAuNk+rAZak2mMrrqrfIZMAbVSH9AbsPe4ravf6jmYhlDGSACSuLF/JkovUXsb/ALTKwm+/9rWfhlhCtEJL6w/E9VWChgVNw4cPBr0dKenPgRKXuOAqkI5yrYdNQTVRwSU+Xnnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwb40MMhU4OqdsHzAZOsCk90aI+WPv1Km4pmNgcYxtE=;
 b=lEgtE+6WNjrjCD7hrE1oR9JgXXlvLqDF33HovtnESSxj8mYcZwL40k+XSD3YdANhjImgTZNxCeCe3fQRozWXuqFTIxp0FmktyTgBxhfVJOPhgv/nAMRVNB9ujlI9ptsunrXOHEp99xuQ8Ar33b0/Uh3326mJEFs0QLSEty0tJrk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Fri, 20 Nov
 2020 16:35:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:35:06 +0000
Subject: Re: [PATCH RFC 0/5] Fix accidental crash in iotest 30
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com, den@openvz.org,
 eblake@redhat.com
References: <160588966278.47.2041524974915724124@9aeb27d8af94>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8a3550ba-ae08-7256-469d-1ddd2e6e985f@virtuozzo.com>
Date: Fri, 20 Nov 2020 19:35:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <160588966278.47.2041524974915724124@9aeb27d8af94>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: AM0PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:208:122::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.108) by
 AM0PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:208:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Fri, 20 Nov 2020 16:35:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcefb1eb-0bc5-46d6-663c-08d88d723d54
X-MS-TrafficTypeDiagnostic: AM6PR08MB4599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB459968526B3315F9EA711D64C1FF0@AM6PR08MB4599.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: efuhVoG/w7SZEqOZiul8b83LZ/62RnykB2oXoi1aHMj9Vkzr8T/2E5oMQh657N5UvPXR0LvchN4zXu/DM/vbmiaUtqUPVQYP5NlVSNODkxjwYMT6vQcFshxflkvwKRWgjFdxOQVY1K9xv0r98L5XHFMFkJtgjlyP+QuYDeh1GUUutcLljCmWEMBI8YV+KEMpgU0q2cHwhIWAyIiJLqKvuCM0JQe+TEA8gkvfrpycXF4BOma+rS9BDxdrZZW5iIpzEkBOr57E3gs6ASj6jMkeVyaYrp9DN0ka7Bxdbf7XqUM6UE8J8OJ/Sw2KQ0+DfNGakSEacEDdhuV+kGmDqas1QKBzgC1aM9VcMurgF4seDc1uBZYzaJINn8OBxroIA7OHKjrp36ouAcFGdgwnYlIywB/A8OXokoFmh6/QNIa9LWQx/JSiydjRBycQBT3KpZpEVNdwluAC4KoFzToYALrTNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(136003)(346002)(366004)(396003)(4744005)(66946007)(2906002)(52116002)(2616005)(478600001)(86362001)(6486002)(16526019)(956004)(8676002)(66556008)(186003)(5660300002)(4326008)(26005)(7416002)(16576012)(66476007)(6916009)(8936002)(31696002)(31686004)(36756003)(316002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: nlbUa7yDm4ME5vpnIsxUYF5A+4J5eL7xr1dMXa5+ic9YZ+2tCCFnFf6d1zwe+Mu0DJKE+FpHvDkB5BWe1pANn/y3VtOW1dH7EEXKH4h4rHIAhI86LyyZ5o6fyiyQGWGJ76OUhDHzrS74fLh3POdKbIQJxQP7nK8WMyIuqOmlqhea8IRfMh4+tuWhxR3BYj+DHwTglrOqjNOMvzbqYkN2HznJT/mNy0vuJunapY8z0hNWF667SRh8FktdhR8Rno9Y5S73r9a8i2EL3F0IDiJZhISriK0sNbLiTgxY845Yfn1cn43TCY4XeseQJtDODGGqs/z83qo6V4/aJoLUJlf5cGnO/iPe1kePBYezIFtZjXLBFJbSg0AYVusQftvtLbL+67ewvbiH4pXjTigA3GTyp39tvO52RWt0Cx/2cOfa8jw/aLtgwrMFkNk7+cX653zmKoa0a0v0lx0eilVJkADmCgm7rOut4DBoY8cRsq4vQLOHhJjcF0cAiu0dde05nIpsoYFik5VWu3dWaO0tP+Lod2QsuSgY9KHMgR6Tv0rNUWB3FPcwGa4Pc7YTcPnmWXVrC021m0N24Cm+X0mLFqNNoTbouwG3q1j5ztORzwhGvYtxiXDkLuv6RMCtEZJRkA2Nr25hYneMwIAkKCxgoYRq8A==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcefb1eb-0bc5-46d6-663c-08d88d723d54
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:35:06.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DcPSH0SKFIk+l/GMyT9jcgYATQsglWY1lDTP0sG/g73/Ri1hEodFnJ8SgSB16gIk1FhyvC9vEv6rC8YHtvmRctMmOBQ7nEgcR1YrK8kVks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

20.11.2020 19:27, no-reply@patchew.org wrote:
> Patchew URL:https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:

This is an RFC, so I didn't care.

-- 
Best regards,
Vladimir

