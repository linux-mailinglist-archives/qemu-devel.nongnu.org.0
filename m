Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BD2CBCCA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:20:30 +0100 (CET)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkR7V-00089S-JO
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkR60-0007S2-Up; Wed, 02 Dec 2020 07:18:56 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:62958 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkR5x-0003za-MM; Wed, 02 Dec 2020 07:18:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyGRl409xBlD88SoslShdwRC9i24imFDDbEOXnuPTj3rK+I1Jlgp6RSDsXsLRmP24MhT57WdZbHe4nhHwv8i/yaIf4FVrtSNcG6ExJ+yhcRdEYS35Vw+Qh389f9UXP6IQkzfnf4BBPOhr9iTMd+4lAT7kJdurHzgTh9tiEygxZeAbI17GpRaRcmkePIg66bvHZsyEjFdalGL+HvY3oHaASmKT3qKTvMa6fdM1vSBnPYeqGPUtRS1pnHaVrY37/b/mbFQgquk2yQU97OVFZ3p6VXGQ7f8SqMUhWotDJ2MF286Yadox3qqbQTKebqu21LDd97F07CvXBXeBus/vKPIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEYRwuNsTVOYo8SCnEfYFYMgKm5cGPsABF8lCx54SuM=;
 b=dXGTQR6MLBpYTQgHlqPcugEny7rbk5PsJiO495l0eSJRTq17yYfghOMLTqQ3dXRT3fsyEsmM64cI7tNvWm2H0kZTzE5l6aef0AcMapX0/OVvMqpCQg6qL93SOhY7BKOrdgzJAP0LYrOINfeSQTQtrtXZTHyaJwK01N8CGXwK4CXr71wxSJsndRHtMI/HFgNO78B/Y6h6A1SDNPJsioCWavTt3EAH9S8ObiEDqpJeT14PrmMlpB1A42pfAsaKBwM+SvvsM+j78GA1TZefXyXEEtL9lew7el/ws8ssr3UsXV6kNsh87+gr+Jk2WWjSsa07duCwvBTZLDsK0Yd10d8THA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEYRwuNsTVOYo8SCnEfYFYMgKm5cGPsABF8lCx54SuM=;
 b=bxdJ3mfmiOYWtCakTRq6R/Gq1hWGa2hrTeitI42pkVvI9Lt7DqFDDs3XrXee/EjCR+cZnMCA7LDjkcZBSKFvDOX5LTKiguzLs05rQhNS8zGN4yBrXg5sD60DGogz92cQNHWIMcq21j8w0c3KUrz1IREv7DxSOoQF/6CCKYIBKG0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3096.eurprd08.prod.outlook.com (2603:10a6:209:43::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 12:18:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 12:18:50 +0000
Subject: Re: [PATCH v11 2/7] block/nbd.c: Add yank feature
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <cover.1605439674.git.lukasstraub2@web.de>
 <14b78aebabb64b9f2ffaac025ee3b683bd7c9167.1605439674.git.lukasstraub2@web.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <aa30fc7e-5817-6986-54a7-56731e8c043f@virtuozzo.com>
Date: Wed, 2 Dec 2020 15:18:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <14b78aebabb64b9f2ffaac025ee3b683bd7c9167.1605439674.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM3PR07CA0090.eurprd07.prod.outlook.com
 (2603:10a6:207:6::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM3PR07CA0090.eurprd07.prod.outlook.com (2603:10a6:207:6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.9 via Frontend Transport; Wed, 2 Dec 2020 12:18:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb86f42-aef1-4a03-6b82-08d896bc6ceb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3096:
X-Microsoft-Antispam-PRVS: <AM6PR08MB309681357FBC31EEB1F15D7CC1F30@AM6PR08MB3096.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pP0JuY31NkPh/OwfV0vrSrjcaO685rGEogP9DP13VqpPV4TcMWLNuP6Wvfcq3ZFXFio3dqwyhUScst4MY95qFJ1J0xMAM3ZeETqDL/fmhwTF9KVE8iYp/JfbQHj/AFmk3BYeMpsKQzTtryf9rcG/RuYXvDszLZ+oVE3azk1qP+Q4aywSpHMXWnE+HjYn/ytWjPoJVmEu2ApzJa1U4Hp3ASuZtqFjE/ccRGQaFFG2CFbQFAKsxZDoQPXpGxLfVyzlu+6xv+qbpa8wu81tgej/lH+aOPRnKKoFXF6NRFlCL8Hr8lyUFxJ2Hn2GZMpjcmg7xyJPPtuFFymCqbOiLdmU7SCCnD1Xyoo9nOE5jSn4BstekNRoQ3BW1TxppT4kFpTYQDTSy6g7usVgMKbdEw70kU7WyPRIc6fMHS5d6cpaj4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(366004)(376002)(346002)(31696002)(316002)(956004)(2616005)(16526019)(186003)(26005)(4744005)(7416002)(66476007)(8936002)(4326008)(31686004)(36756003)(110136005)(2906002)(66556008)(8676002)(16576012)(66946007)(52116002)(6486002)(86362001)(478600001)(54906003)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?QOs5PnOq+/0BJYDeAr7HynZKEk6Iq+6AYqQFVebIaZLU3LK45IbwAz6I?=
 =?Windows-1252?Q?42NWuHeJAnyAt1PKN5Ii93vZIgBz5fzEgWsynl5B9yryHq08N4206l5t?=
 =?Windows-1252?Q?+OapmLl4NHFN2zsokLt477elJaLGkfknq6dZ8Il+oXoz8KWuDY2w1d0+?=
 =?Windows-1252?Q?953ubDFAPQ8D4Kqx/QgZr38M8nH6L1Rfs6zZut0qGp6blZONn8o0+esA?=
 =?Windows-1252?Q?B+GR0LLDXrupuMndoFfKNgPeFoao0n1BXQUOTFuJBEXvC2vBkPg4+eJo?=
 =?Windows-1252?Q?AYqbVo3ffvc8wyb01libRZQj9BTPRm0FGTpxuSBGh7gKywjNR5OpbJLP?=
 =?Windows-1252?Q?CMWSBHPV2DE295dZNLfhgByISz0MH2+EDT8nqUWE57Ea1uk1f0AHjoE4?=
 =?Windows-1252?Q?tSDCulgO6Zm1GEaAjxRD81QSevjIoscZHzCv/crgMHXe/pBoyx7ALF+7?=
 =?Windows-1252?Q?JWymOaqgCyat0WkRe7PMVHfRosJ0nwYCrgaFLasLW3s9q36Xig0N5uu2?=
 =?Windows-1252?Q?JqRWjBqnF6PBG+Sum7CFPAwSH5zTwiSA2X0k/Ao2Ky0hkATP4rttLFkI?=
 =?Windows-1252?Q?NlnUA6qqPqoXvX/i+Cy7rKW9sepl6QZnRcQnC4MOCZ4sFQ6vSeIz7vNc?=
 =?Windows-1252?Q?ui9AlcJNpe10ckhoSRkBqX8Qt8iyd5CiCGVyMI9tkMyvVfSNViLKX1NI?=
 =?Windows-1252?Q?xjeHCbGkkYB8BDOgu7iMbKZlGA+xxZ8eaO9hkGdU+xia5hNt4EdfbhGM?=
 =?Windows-1252?Q?6z18cjkLIkkRz2nXlPIAsqemdB862qj6KDjFWL6Z9a34UFGPC7Czm7+5?=
 =?Windows-1252?Q?mJRcpvo91ZuR3qa9BWW0PujZYhw+qZt97tCCi3Bq0Mibzf8FSckO+lUT?=
 =?Windows-1252?Q?1YjoujqAXAkfw7gNfAoXB+QpO3O0E39a4cfuiz1GvyqIxkoCLJh51UZT?=
 =?Windows-1252?Q?s+r2jfjzBymWdCHlnYj0jVfTJSdkZ1XjnKZNpqHcTyuP6mnnBcOd8bR1?=
 =?Windows-1252?Q?KJiOiidkxwcbN4c0rjvlg3AL17ozndwD2BRjw9htQ+ZKLjt884St+kal?=
 =?Windows-1252?Q?PkXl1r1MTqizZUzm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb86f42-aef1-4a03-6b82-08d896bc6ceb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 12:18:50.1666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v3fCHn+YBhslBTRQeojzH3aH1BpnEuvTa+Sq4DaY6vmNiSHSR2YTVTDJZiGDQOG1l27cwp1kJqN6Nw0ZJDlGo0K4o0xKMC5XJtCq2zXFqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3096
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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

15.11.2020 14:36, Lukas Straub wrote:
> Register a yank function which shuts down the socket and sets
> s->state = NBD_CLIENT_QUIT. This is the same behaviour as if an
> error occured.
> 
> Signed-off-by: Lukas Straub<lukasstraub2@web.de>
> Acked-by: Stefan Hajnoczi<stefanha@redhat.com>

Hi! Could I ask, what's the reason for qatomic_load_acquire access to s->state? Is there same bug fixed? Or is it related somehow to new feature?

-- 
Best regards,
Vladimir

