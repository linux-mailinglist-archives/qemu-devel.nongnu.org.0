Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78506645A3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:10:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGby-0007N3-7d; Tue, 10 Jan 2023 10:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pFGbZ-0007FI-33
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:32:11 -0500
Received: from mail-dm6nam10on2072c.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::72c]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pFGbX-0006zX-Ma
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:32:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lng/ZUnatalE8ZLigv1xLhCJl1AI0x7MU4+5hCXVNuFoPt+CRPCEzzW3kUJxiCIH/U4DVkrMMml5nCBcTlGyX4y9teEsYe6viMtMfb6nGsMr4GblPNWb+cIMmAEJ/lo46+tmBl90sSqJImyanCRZlNRF51UCG2tjFS1xey2s75wTNBFGqLhiFHeOT0/9/W/8oYeebfg/eQMB4b11qHqZM6auJ6HHx9V1AM492M1gmOlgwIQga1FMSp3MuTuo9MElfjCsmd+7Od6ySq7QIxhVVck6xHJrQbE8WxCg/QJTKPY9/QRmnGq0dgra/5rqRrwlVnlB75OCesRRQJP5Ojp7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c10VSmhfvUYVT3Zm6tngemAlptTjhLkuw0GSAfOqzhI=;
 b=g8lnWu8G+faUBuqcNKXXOqA/42wM3A2crB4eVYfj2MLxXqfNHbgSNVIIedkb1wDbS4iq0cACWmCwFMwCMemYsO4eKVY8yaFdg5BPgUwthQWKMNGFXRJe9/m0tVuQ8V11yPPmqpQGp7/FteUlPEZ/+F7Uz0+92v7USfaMNhS5FhHbM02KjCppY1mWGvwavmGinqEIC3dwINQJKXn9IZ8YwCUFU2ctQJFQhTlg3BBnXrNXcLiV+Q+oMS5CdfzEYrnYJUfpkDUvOt5FXHuXYh4xcBivu5ojNOLCBufQPJfixi03l276wrMfelZy7UYiDO4GcEEIKeDrBj89gEt6F3NODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c10VSmhfvUYVT3Zm6tngemAlptTjhLkuw0GSAfOqzhI=;
 b=t0lliKHqJJlvNFOSBBWwSQkQY5C4dk4+pku0javM2/r1lZQQC8oUmxfgQKjE+KQAWkctSHKt3ZDEkeKUfk2HEcc66nhBrY//JfBPYW0DN/TuzUMlIXLN5RMS4mFczM3qqlC4xS2WiMe/yWvIOaVxaUzXSoVoWYJObw+32rsrAis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 PH0PR01MB7426.prod.exchangelabs.com (2603:10b6:510:d9::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Tue, 10 Jan 2023 15:26:49 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 15:26:49 +0000
Date: Tue, 10 Jan 2023 10:26:36 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/4] translator: always pair plugin_gen_insn_{start,end}
 calls
Message-ID: <Y72DrDKMfOUZ9fwd@strawberry.localdomain>
References: <20230108164731.61469-1-cota@braap.org>
 <20230108164731.61469-3-cota@braap.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108164731.61469-3-cota@braap.org>
X-ClientProxiedBy: CH0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::13) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|PH0PR01MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 87df4378-649b-461c-fadc-08daf31f1760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUcyWjuXjcoNLQ8xyhJtbUufLo8BReXsmLgUuxTEazxmzlJXE6PoHQD7vHsrdWVcEOH6kpHi+3wmjdyexUDo3/8sMxa8FVJhpIUoWAESPbVcud8WzLNbY1oGq/VIVa3WkdBHIlac2B/+oSkNLUSJ299cD8eEKKNEmd+LDpoII6cYIBHwMFSzHgWhsdy9j+ZtvYunKgUWkZu3MwfWFC+HMn3Og2q1/5Plq3RWmxk8VM/jNJdVvwqwTz4tIM3DG3wXmisnP0xH1wXMx+o4ZLhkGPXSdOpuye28AAqfZrm0RjliAKVglHNNGHI7b/59Ue0jpGpEhdv+9vo26d+FnW78NBNGUUNarkRAsKwhqoh5+7ez/vow7XOe/DOcFUzCdK4cfsMyYf4GeGBTVhngVaoUWMo8u2aRTFV1gpYlKrX17nonYLxkTC6guM4KN06TwSxsfuhLVWVMynlbbSeYAPoq2/X/MIwkMmMvS9ZrbtVhOvOMrKHFpewzbM1cYgZZYrSFPT6ETR0EWzLjVs4toYuy9ppZZmvE9Cv85mQlEt49X77hlWG0GwBPnoBrJ3mqQI+yZ1EzSCU5kQBc6HN4KiOrP57ShPic/1rfPk/EkHR4OxUFx+H91e0iNozQ6PKhrcIsQzYTjuEwQE2l/oIiLiVaUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(451199015)(66556008)(86362001)(6916009)(8936002)(66946007)(66476007)(5660300002)(4326008)(558084003)(8676002)(2906002)(38100700002)(83380400001)(478600001)(316002)(54906003)(41300700001)(6486002)(186003)(6512007)(6506007)(9686003)(26005)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+TMMI40NsjtAamuRAlTeEe6fdaYUL7RwWYm2JXVbAhJIVlgjk0DYzvUbcR+h?=
 =?us-ascii?Q?qIBShwCibbyug3Lv0UN55dFZW/shJ30UBTvtoJnRp76qc/gw06pAfsqYn93D?=
 =?us-ascii?Q?P7nTX0gnallKt+ZkvogcFHkxnhFS29e9AFS3ZOiyNWKEvBh6OGz909H+m7P+?=
 =?us-ascii?Q?lxf1iVNX5BkWAnfSsOAyD3tDifzYkUZdS2W3MUmwar1GDbVdCCfgqKzncz/C?=
 =?us-ascii?Q?2dYe9sGUhAiRq6dfpRodj3Z/zenVySwm5HrK8jEndTFY/crDc93HpICVJqXo?=
 =?us-ascii?Q?m+xjiDnUAsHhoPOg4nlJS32LVEKjILS7HBA6Kk3W74Q3tWsqk35QJ3MEoCBc?=
 =?us-ascii?Q?uWS85EwnrpL0IIoBogNIBwHsAHOL8nDzDVAHCa+vmw2veScpwv4RfPD9Mo+z?=
 =?us-ascii?Q?e/kmjxXY1uJtFnJ3LsE2SutUba0u5O/1clUNG0Sn81LoLJWOTMoErWi+aVrq?=
 =?us-ascii?Q?xXXkOAOWS9LnqjEID9vzP0Ug9GctO3NNF+2CR8AeAbOSTk7/mwrSdx7I6g01?=
 =?us-ascii?Q?27HiL/iH+feEz8mN65ni8h3ehuQPO6sOtXBejwiyfMgn8pBeB3Kmat6G1wDn?=
 =?us-ascii?Q?T3de1Edhz2PV1Hp0R0tAfXmhQOxZGwe/Owm9k2cfAUr1ManVZ8cPhS2af5W4?=
 =?us-ascii?Q?yrUCHUM3yPeFF2JjPhRo77euO0krkHd5ZuYOdRou/KW6i0d4roYkkq+pL3Zo?=
 =?us-ascii?Q?2c7hFnEKRC5D5m20/1UdWqe7sUueaqpOYGgunCqK+krbdg/cMTkQULSHpUgw?=
 =?us-ascii?Q?jJxyNq0BfqNrtejA3gqk0s1mzM/EojL/I+1itAs81oPMorO7T+fGQ69w21/r?=
 =?us-ascii?Q?BuDoPSmOgcnWvSK2Js87CW48haIP7B+Mv7/c5y/QYqsqDr4fqTfYdRM3AUXv?=
 =?us-ascii?Q?s6hfEgOhThOtSEbfgceV4/Kc+JZv0EXHw9UNr2TNNiMO4td+lq4DTGfcORbm?=
 =?us-ascii?Q?idsa09Az9jCEYXG3CWQmUD0UpPhnzC+lQMMI8e6ZpBE5kfO6s0RoWmceqyF+?=
 =?us-ascii?Q?gn0mwbcgtAkZ70bmkyopwjdBbdSHDZHc81MxJnR6Yy7jCnC7YR3H5NWBbQ/r?=
 =?us-ascii?Q?78xt5sUjrpjBz6LHHVRiIe4+Bt39qpWhZW0SX2SfT6vrkopkQnVt4IFcVWJ4?=
 =?us-ascii?Q?xidHnSrctQZIVzzXK1LfDbOli/fkzoE6WhlJsBO24isZXxEb3Be4vODNKBwC?=
 =?us-ascii?Q?6VoWJSXzFfe4+aVBr9VRVudEJAC9HxHdzOalAjZAxjShJhzcZu7qCtXUC02z?=
 =?us-ascii?Q?Drv2/jGJpmCEvZAsB1cZmQ8GCRTuh3rCzd8KZPUwQdPUd4Fy3qHyZW5mIYas?=
 =?us-ascii?Q?lJM9fk3HSPOTCk1aXpYQuyex4qhpCMtTn6/kDTjUp67fwn0dylZQdJaRHGMF?=
 =?us-ascii?Q?jet2fVZQIn7MwEf+Gf+ObywSNrqKVfDuomJXzWqcZZSbLQ4u1dnQQkkjm2/N?=
 =?us-ascii?Q?41dLR/w2WWNkiiAv1g2sHsC9XmNFH/f0vNuSV2ZXMSRYsTP/XiJKylQrmDZa?=
 =?us-ascii?Q?VE94ytYTiTBONu192hf+K3nykv4/C2i5dD9dqpAwbQn8TqNNWnYUL2fbqPsF?=
 =?us-ascii?Q?xSTjV03J46GRWtgDKvd2gkFtXpFSlLNfWo1RejKa4NO1lp5Myancg1plqMj6?=
 =?us-ascii?Q?PgG1A1iq7y5/M/v+PReUUPk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87df4378-649b-461c-fadc-08daf31f1760
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:26:49.1251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvd+GDM580jcgEEa0SDx0TPg46T//0eTRnr1Qs7scEsrbmWHak+URXZYzr1HVrNF74U3xYMPZ+9uqgH61Yb7WR0pZz2HG6cDn4Iy5sjmgGp0D/dmKwXv0heqaaIK8XQ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7426
Received-SPF: pass client-ip=2a01:111:f400:7e88::72c;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Jan 08 11:47, Emilio Cota wrote:
> Related: #1381
> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>  accel/tcg/translator.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Tested-by: Aaron Lindsay <aaron@os.amperecomputing.com>

