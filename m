Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98924B74F9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 21:15:20 +0100 (CET)
Received: from localhost ([::1]:55680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK4EJ-0007xI-AE
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 15:15:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nK4DO-0007Ez-18
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 15:14:22 -0500
Received: from mail-mw2nam08on2089.outbound.protection.outlook.com
 ([40.107.101.89]:7086 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nK4DK-0005Ks-Ry
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 15:14:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSmeuJaxHsCPTg0BkDbqfbrwkJLhe/23+9nT4CQB/DnKBKq1RJ5a4BXo8K9+ql8l5SlNGf0LFPcQUsqUQc5uMe2nJG8/QtM1HbctilMat9tmULt2OwiF+2u47t0doS/tFWS+cI3HdWWEhzptyzElnblcw9A2kJ0d4vsx6ydDD8wsV+SV86YiVgJe6LlNEREzBYrz74d34LZyfiLt+7Mkfn27TzznelHAz9jThcotlPZDf+G1I1M7/EMWcIjjN2qxqJX7QLkoWD1JA4SknyA0ahKxNywlZa/ndWWMZASnofMCdM+1qqm9ufr+RBXLXatuHM0QbbmPJaH7K5rqqr9jXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78xv+daR8HORAAigLq7oOm+uVRBtFRT8s7oFyY6cx94=;
 b=JbAd6657jjiynANp59S4KqAFlyMrniCsSzOFEUIn/rWPMcJYwFpNJ/vUWQ/piWQhNUiBN81kVzydC48yVsOaI9uSkNOgAFo+/LePEbjgZ+JRrBIv0qwLEbLGYnQvGak71XNxGKzHhzmRFCF0BB03TNKavax1c3VGdsQQkWQOVnUTntCdpF/7FuDt8CAdy+pkbr8xTv/hrwbd+M8KtPPkYSt283IcKWEglYZtOtXsg9Vsq95TO7bzTeSWW238GK2buTcEnTSAbtaO1NuIzRisH4A0Kh97s0sl08VOovfjnVBbcDdACzZSJj0PbafhQ/P7VZFYkr02D2X16Y3rOHN93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78xv+daR8HORAAigLq7oOm+uVRBtFRT8s7oFyY6cx94=;
 b=zwCLSMNthJ7owQDpDY8FiXiJpm39mrF5qW2t+kkwbvKakVd+5c7elsHalZlQ0UplL7TqhSjes/Z/S0bZ0zA2wZTqNf3H8BtCnHXtZAVSeErwfqTWKpTTmfsnD0wdelwplYh990ULo/iwzgcFRwVqHIk676InnXlE5ZZozWmfqAs=
Received: from DS7PR03CA0136.namprd03.prod.outlook.com (2603:10b6:5:3b4::21)
 by MWHPR1201MB0078.namprd12.prod.outlook.com (2603:10b6:301:56::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 19:36:26 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::8b) by DS7PR03CA0136.outlook.office365.com
 (2603:10b6:5:3b4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Tue, 15 Feb 2022 19:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 19:36:26 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 13:36:23 -0600
Date: Tue, 15 Feb 2022 13:36:01 -0600
From: Michael Roth <michael.roth@amd.com>
To: Markus Armbruster <armbru@redhat.com>
CC: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Adding a handshake to qemu-guest-agent
Message-ID: <20220215193601.7bfexzqnpsprjg2t@amd.com>
References: <CAFn=p-anWO3dpvcECpW6J1ExJLw01DhXvTYtC5FUi5p7kQ2tig@mail.gmail.com>
 <87pmnwqzq7.fsf@pond.sub.org>
 <CAFn=p-YVdQDbzUsQm97=FyuZN_m3jCsFzjTpguRPjtH3PezTMg@mail.gmail.com>
 <87zgmze0im.fsf@pond.sub.org>
 <CAFn=p-b-gfeDgFfivtJ6tOixyydRb1kS8rS+H41RjiVZ-3Sgsw@mail.gmail.com>
 <87czjpilgy.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87czjpilgy.fsf@pond.sub.org>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 531b902b-4fe6-4c43-e5d2-08d9f0ba74d1
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0078:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00784ABC3F9538CB2F8DEA9395349@MWHPR1201MB0078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXtd48jGIk/IkMNvRPR9G1odYnlxb6yhW0q8QXQsuQC9yXPw5LIpxCe0B8iXAz8a06BxrR7PeK0vsrU64dU4s8oxM6lI7VfugeSp9fv6efINEK8clCtRKxeQTInSbnB2YVQZb61KUWQroiOS7jbbXEUxTDm7DpjSgQh9YVU8fm2JcuAmgIcSa//2iaqK9etJQwUQs0fDgiiokjri+CLNI/Jdo2/a1x7liqBLZ5M3h+D+sPwDZE/tjKs460WcTzhyNCtcXIOlF5nU/C+IEDnGUVVRNdpR01hdlMLFPvWH5u3DQhCUrtrt/ajsoRIBe3PGoObI2d5gbyWxPXHjpFjrOtlKEFOTMpsiNniiV6oVpHGik8RpsUAQ91c7+NL3r7PnGNVYv/1+oH0iGDSEMUFlRvc+hCcTLWgHrKaRcygCmG94TFKHn/tRjtKq7ifsbALujYX+WaP/AX7XZKqfJoedzFemEYWWaIlxv2aTlfbTwNCBXI6nTrRGJvx4A+HCT2UWAm8tA4D1LY67GtNjv6kOgDK0vpxtAGDW67J+qyYDhaYn7UF1fB7+wk5ECSDvyxOmrCaNfkWPiCZjMniAt3Qgx0ydz0vmjtOZWBWAOBGfDszQqE7yIWBcf4iIrCGhGUnsVu6mFs9IXLZ1MOLOc4jmHlVjZALP3/Nh/HdypNq6dFv0HNur5PosIA01pvplPjUCnXT4Y6ihpOzDHzhcXDfJRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(44832011)(4326008)(186003)(70206006)(5660300002)(36756003)(2906002)(86362001)(8936002)(8676002)(82310400004)(81166007)(356005)(16526019)(426003)(47076005)(508600001)(40460700003)(70586007)(26005)(336012)(6916009)(54906003)(316002)(83380400001)(36860700001)(1076003)(6666004)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:36:26.2882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 531b902b-4fe6-4c43-e5d2-08d9f0ba74d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0078
Received-SPF: softfail client-ip=40.107.101.89;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Feb 14, 2022 at 03:14:37PM +0100, Markus Armbruster wrote:
> Cc: the qemu-ga maintainer
> 
> John Snow <jsnow@redhat.com> writes:
> 
> > [Moving our discussion upstream, because it stopped being brief and simple.]

Hi John, Markus,

> 
> Motivation: qemu-ga doesn't do capability negotiation as specified in
> docs/interop/qmp-spec.txt.
> 
> Reminder: qmp-spec.txt specifies the server shall send a greeting
> containing the capabilities on offer.  The client shall send a
> qmp_capabilities command before any other command.
> 
> We can't just fix qemu-ga to comply, because it would break existing
> clients.
> 
> We could document its behavior in qmp-spec.txt.  Easy enough, but also
> kind of sad.

I'm not sure we could've ever done it QMP-style with the initial
greeting/negotiation mode. It's been a while, I but recall virtio-serial
chardev in guest not having a very straight-forward way of flushing out
data from the vring after a new client connects on the host side, so
new clients had a chance of reading left-over garbage from previous
client sessions. Or maybe it was open/close/open on the guest/chardev
side that didn't cause the flush... anyway:

This is why guest-sync was there, so you could verify the stream was
in sync with a given "session ID" before continuing. But that doesn't
help much if the stream is in some garbage state that parser can't
recover from...

This is why guest-sync-delimited was introduced; it inserts a 0xFF
sential value (invalid for any normal QMP stream) prior to response that
a client can scan for to flush the stream. Similarly, clients are
supposed to precede guest-sync/guest-sync-delimited so QGA to get stuck
trying to parse a partial read from an earlier client that is 'eating' a
new request from a new client connection. I don't think these are really
issues with vsock (or the other transports QGA accepts), but AFAIK
Windows is still mostly reliant on virtio-serial, so these are probably
still needed.

So QGA has sort of always had its own hand-shake, ideally via
guest-sync-delimited. So if this new negotiation mechanism could
build off of that, rather than introducing something on top, that would
be ideal. Unfortunately it's naming isn't great for what's being done
here, but 'synchronize' is sorta in the ball-park at least...
> 
> Is there a way to add capability negotiation to qemu-ga without breaking
> existing clients?  We obviously have to make it optional.
> 
> The obvious idea "make qmp_capabilities optional" doesn't work, because
> the client needs to receive the greeting before sending
> qmp_capabilities, to learn what capabilities are on offer.
> 
> This leads to...
> 
> > What about something like this:
> >
> > Add a new "request-negotiation" command to qemu-guest-agent 7.0.0.
> >
> > [Modern client to unknown server]
> > 1. A modern client connects to a server of unknown version, and
> > without waiting, issues the "request-negotiation" command.
> > 2. An old server will reply with CommandNotFound. We are done negotiating.
> > 3. A modern server will reply with the greeting in the traditional
> > format, but as a reply object (to preserve "execute" semantics.)
> > 4. The modern client will now issue qmp-capabilities as normal.
> > 5. The server replies with success or failure as normal.
> > 6. Connection is fully established.
> >
> > [Old client to unknown server]
> > 1. An old client connects to an unknown version server.
> > 2. A command is issued some time later.
> >   2a. The server is old, the command worked as anticipated.
> >   2b. The server is new, the command fails with CommandNotFound and
> > urges the use of 'request-negotiation'.
> 
> A new server could accept the command, too.  This way, negotiation
> remains optional, unlike in "normal" QMP.  Old clients don't negotiate,
> and get default capabilities.

...so what if we had guest-sync/guest-sync-delimited start returning
capabilities and version fields rather than a new request-negotiation
command? If they aren't present we know the server is too old, and don't
have to rely on CommandNotFound to determine that.

If they are present, then qmp_capabilities can be issued to renegotiate
capabilities. (I agree with Markus on enabling default capabilities by
default as it's done now so backward-compatibility with older clients
is maintained, or maybe an explicit flag to QGA to require negotiation,
but only if there's a good use-case for requiring negotiation in some
cases)

> 
> > Compatibility matrix summary:
> > Old client on old server: Works just fine, as always.
> > Old client on new server: Will fail; the new server requires the
> > negotiation step to be performed. This is a tractable problem.
> > POSSIBLY we need to send some kind of "warning event" for two versions
> > before making it genuinely mandatory. Also tractable.
> 
> With optional negotiation, this works fine, too.
> 
> > New client on old server: Works, albeit with a single failed execute
> > command now in the log file.
> > New client on new server: Works, though handshaking is now permanently
> > a little chattier than with any other QMP server.
> >
> > ***The QMP spec will need to be updated*** to state: the asynchronous
> > greeting is mandatory on all QMP implementations, EXCEPT for the
> > qemu-guest-agent, which for historical reasons, uses an alternate
> > handshaking process, ...
> >
> > Compatibility concerns:
> > - We must never remove the 'request-negotiation' command from QGA,
> > forever-and-ever, unless we also make a new error class for
> > "NegotiationRequired" that's distinct from "CommandNotFound", but
> > that's more divergence. Supporting the negotiation request command
> > forever-and-ever is probably fine.
> 
> Yup.
> 
> > - QGA is now officially on a different flavor of QMP protocol. You
> > still need to know in advance if you are connecting to QGA or anything
> > else. That's still a little sad, but maybe that's just simply an
> > impossible goal.
> >
> > Bonus:
> > - If an execution ID is used when sending "request-negotiation", we
> > know that the server is at least version 4.0.0 if it responds to us
> > using that ID. A modern client can then easily distinguish between
> > pre-4.0, post-4.0 and post-7.0 servers. It's a useful probe.

Is that in reference to the optional 'id' field that can be passed to
QMP requests? Don't see the harm in that, and QGA should pass them back
intact.

> 
> Mike, thoughts?
> 

