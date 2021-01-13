Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347542F5428
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 21:35:43 +0100 (CET)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzmrl-0005dk-N3
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 15:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzmq1-00058X-45; Wed, 13 Jan 2021 15:33:53 -0500
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:40614 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzmpx-0002Ja-6v; Wed, 13 Jan 2021 15:33:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvyrOik2MbXDbqeKW5ikmOrMc5KjAIccHNjZJHWYt8lailsPYjLHUC9C63MH2huuISQnK7egwGZy9RxViDyydkSSj1EZ2kM1QL8LRu+DMQ7pk0/pZ0uHEX/oMHuntFnoPEt4Ypj32hnfEj+yNjF2hODvlFeJ6ipIiCr5r58dRmA8m/PzKLnqvWMF4mQIBmMk0muYIg0E1sbBHX28Gwn2IlVEer1yofishm6M9vPLYjXZo1EKgpI1fTkEiteEqC2CRI4JuK0gqMhVLtZ+PNy8Oq0xmc5ueMJ0/NQ20qp/tdo0VoQoqaHzvKQddADPe6Rhs601q/d10/d17Re8hgLY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzJ4e7InmoQ4PboN9Z1wVmLk7QvhPnGPMuEmY5mZjCI=;
 b=GtBPYPP1Dccnj1uUQu1AB0cIYH6iPvbloS2NpkFNjhXJAvTL2bjOIr+4qO9Meut4jognO5lyyiy9tYtP9dDYBIyWDbbrR0e9ncmGa2jNu6G0MPFHswoRD3K9jQBgE3muwZvoCbGHyRBk9B3CWtAYmB7ItCvEsPokhHNNfrx/MhTPYQl+56l+Sm15/J+r2OQZ1lDc90+XCVCoRID9N8XlDbMKEQikP2/ofYXry8hEL6+GD2nm/8bjUPDlSd/IkLtiYramDbqXN1V9W+Iiqqz0F0AfMA+NCmNbsAuWS2F8/RlmSdlI9FEbiqHQ+pJTm4McmS7zRvWVoli2W3dZMYZjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzJ4e7InmoQ4PboN9Z1wVmLk7QvhPnGPMuEmY5mZjCI=;
 b=MBLnmUcFYlnuUD+um11U4REPO/A2hv19DUl3GNwJp0ZxTl+lJurBiYdWdOzZulFo3W59v6pPgPgfDTfDpY+J3JiIOoWPfg0BPxihxa4G4kiPD5Lb7vslgRk0nAu0+bN4DxhgurUA292EV3T9vM6STmEhodhLDYGe8/3BIiPvD7E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 20:33:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 20:33:45 +0000
Subject: Re: [PATCH v2 5/8] iotests/129: Use throttle node
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-6-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2abbbe14-82f2-36c3-b727-95f83def1d98@virtuozzo.com>
Date: Wed, 13 Jan 2021 23:33:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113175752.403022-6-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM3PR05CA0134.eurprd05.prod.outlook.com
 (2603:10a6:207:3::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM3PR05CA0134.eurprd05.prod.outlook.com (2603:10a6:207:3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Wed, 13 Jan 2021 20:33:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80cb0bb0-5d12-48fc-8629-08d8b802866a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3622B078DB8EEED7172C18DEC1A90@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8IpF8yVP7RvvnHB2KhlLXgdfcZoFiS0+Gbm5CDalqc+5PJFOZcuCpY57Z2wG22ZvCuZfKqkcsKMW+nGfo10JodueW/6KotkOBE8EXbn7/9ERYqdJ/0btoEe2H9oLnhokrc88A407Fgt6suRLAWsPr9Goo5YGWRmiZKgy6LFm+TWC4ftR2auqK4abLe+B809H8ge4IjbqMsk2nZtF/7DI5V1KDD8xYK3ghi1PkO37PN1/3EYJXilRzYe/NHc5kPg3uz9oS9c68Tfr0Qq9L0tqC7kMzyxCwWEZfFg/kTQ8p3aMKE188swEQM84Kmv5IgqymgwVx6PrLHd5g+PhCFa3fmn/o0wJyfnnASj3ZQuWEz5OXfQHfcHgQEpZWGtCqmIjH8w3ZB7HyovbO2lPAT15+OUpQLDlRe8mpWCzZTptUemNzzQI0pQONl/aN3ul7SEajObAIuaTK+Y+nwy5VuavzC8c6mMnt0Is+1JcgSFwSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39830400003)(396003)(366004)(136003)(2616005)(8676002)(956004)(5660300002)(66476007)(66556008)(8936002)(16526019)(52116002)(66946007)(186003)(26005)(4326008)(478600001)(86362001)(16576012)(31686004)(6486002)(31696002)(54906003)(316002)(36756003)(83380400001)(4744005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFhaelBsaGRkd2NjNWZZdlJxWnJTMEhWZEVpTlEwai9BK1BDNFB0VEl0VkY5?=
 =?utf-8?B?MG1XLzFjSE81TDJoTzRZNFBQei9IcjM1TWE3eWhnWEp1SFZoL042dWo3eTNh?=
 =?utf-8?B?ckM1U01RUTZwWlhiZTRXTSs0N3F6Uk4raEtBS1hYU2hDMXBZRkVPeUhEQXBa?=
 =?utf-8?B?bjkvRlVxL1pwQnFVUHBLNG1xREdMTzIrTHppTFZxcythdXd5Sy9vb1IzZWVn?=
 =?utf-8?B?b21waHg5Zkczc3pzSnJtZ3o2UHltTng5c0d3MllkQW5PYTY1M1hxT3pVMk45?=
 =?utf-8?B?dER2a0lwZ0F6Q21rVGZJTFd2Tkhrb0R2Y2ZmL1dOQTFCa2NnbVRjMXRMdnM2?=
 =?utf-8?B?OGkvU0hSMnZsVkVRWnVBSVJZUys0clp0THltUWtJaU5aQmNhQldjdnpGaWl0?=
 =?utf-8?B?cURZeUFDTnVMWnVTb0R4WGhzSHBIU1lmRXdYaFRxZzBUbUxGMzdXWUgxall1?=
 =?utf-8?B?dTZYSXcyTXhSbVBOSnY0dlBCNWU1Ri9qS01xajNEOVR5MmRzQXJiNFJzNGdu?=
 =?utf-8?B?MVcvOHZ5ZVp6bFJMRCsxQXZvNGNZODI4NFRxeUh2bE5iQXdFYy9GbDgySy9o?=
 =?utf-8?B?bnMxTS9LL2U5ZzlQMUNNVnQ4MlkwWVpQQ3pCM2Foa2JBcGQxTnM2eVlsVHF1?=
 =?utf-8?B?dnZldmpBL0tJV2E2dE1QbndJL3J3Y2RPSjU4c2VVTkc4WHlhUkJUUVBiNmJa?=
 =?utf-8?B?T0VweFZtam5MUlFWcUJnaWhQNDhDNnJJbVNSQWk5OS9CcnRadVVKWHYwMzUx?=
 =?utf-8?B?L2FQK3lGSnFDa0REenhvYzVkeGVzUUpBQjRJek9BS1dNTHlvTWp1YUc0bzJR?=
 =?utf-8?B?ZklmU0h5TFovNTJYZjNhemw5dSt3Zk5aUFdkNDlDWkNWUVZjcnZxNHpYeWRw?=
 =?utf-8?B?b0dTb0Q0K2xJTk5LVEtYU2FqUFBoVU9kbWJDbXBNWDlBM3k4eFE5ZmNlc1pG?=
 =?utf-8?B?eXE2VjdCaVdCRTV4enhQMUgzMjh4dXdBOVFnMGVZaE5nVldoUDRzVWZWTWpJ?=
 =?utf-8?B?VFA4anlyZENzaVR5VFFndVA4KytIZVJkN2NEYlR1TCtoeEpnRldRRHJWd1p0?=
 =?utf-8?B?bkt5RktmdlhCK1BQNUg2RTZBQWJNb01WNlFwTGYrcjBLOURwUFlaVjNCMFN0?=
 =?utf-8?B?dURyV0JwVEhyazljK1htZDUwZVU1VTdVSFJWOWExdk1WNjZLY0dnNS8rajRr?=
 =?utf-8?B?aThxbEgxMkMwc1Q3cUx5OFNEcVBrQ290bnJaMTJkVmlXWE5VcXVGT2pzYUFw?=
 =?utf-8?B?YlpENXFEU1hyRitwZzlUbmhkeHhWT1hDb1VyT0dJSlhHbllxNDlMWDhVODhj?=
 =?utf-8?Q?a13Pq2mxRpN+1lT8ZlseoeFunP6N66p79b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 20:33:45.6707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cb0bb0-5d12-48fc-8629-08d8b802866a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ol1F6N605ZWqz85gBWW5H9SYYkb+k++bZxCOnv+OheXpfkaXmhyx+0ABMtgqLvUYVJz1lFjmAsM1z397azcAdPsVZAWJFX+2X4cFKMxnEW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 20:57, Max Reitz wrote:
> Throttling on the BB has not affected block jobs in a while, so it is
> possible that one of the jobs in 129 finishes before the VM is stopped.
> We can fix that by running the job from a throttle node.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

