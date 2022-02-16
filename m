Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D64B9484
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 00:32:19 +0100 (CET)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTmU-00069a-5G
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 18:32:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nKTkk-0005OF-HR
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:30:30 -0500
Received: from mail-bn7nam10on2043.outbound.protection.outlook.com
 ([40.107.92.43]:38546 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nKTkh-0001ZW-R1
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:30:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMbu+L8ZVjVHz4voOPoMX0vhvTgvUMDuPLAm0z6yxp0DgO2GnDj0hqCya+kxovA6E1ay2ga0VyjoeJm2tFQ1GskL+8q7ULxm3mC0I9Xeehdl0p2NNoIsZSZ8ASVq/0i6d5qDLzfvcih96cH0eIewHyv4UMmqByWJFxYZ8/2faUrVuywqMJ5kguanb+GCCcmp1AKRSj+per7Q7RJ8ncoB/b3JpWH7cOlU7S1JdTwmOeroCqGCREKfMHN1T/0DqRTdb6No9Pdga0ZGGVIJHivW5j3XnPTlBg/Ocodk+js9A8lq7Tp+HJTR51anvY2/Ui7o9X5XBeTL1KF1bo0m58Iy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnOp1r0MlFtl0h7JWTgnLHa2wWth4W6j29Gwxw1dviY=;
 b=mQeQeZYxaExoanlsnGfvl7/NujGp3qb3nIeqy9KbibG1LKI1ddf9TwuhG3JusJDPbNGJutBRQtNZrFZ8LaD5N/8vs0fED4Q+vIYUtLjHRPluNxqImOWphCXg5+oKdP7icRMzWZ7Dso4GUty9ciq7kSSP6GC8/rtGcPYJoK01b5Y47QYIBoBqlbk3BmoV3weT7g8sYORS1KaMQVoi0Fz2VRyjzrjddzpfBgZ+aTYhIZfTmNoKN6qcYVz0gec0vNLbkoUXl0ueQLZAtZxCqyUed3Yu5ZOuwu9+w9SxDpNbBfRdi/sB36crwcbtGXk9PmfThmrYQQ5oBN/XimJz1w1DzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnOp1r0MlFtl0h7JWTgnLHa2wWth4W6j29Gwxw1dviY=;
 b=ulmfOy0n6UlJWMW2fVS741O5oqtdEhIzoeCgzAegHcPNtxYtw3OxGF9MCXu+XYzBPbMfjyCCwCX/eMaHzUKMZ2AlYA9A1G2ikz4Jy5eGnAJWIppetK7qd/NV5/EqvO/C3hr//d3obNxqeGyYmApeo2WZH+4Rc5Gi+A67caO/XN0=
Received: from BN6PR11CA0051.namprd11.prod.outlook.com (2603:10b6:404:f7::13)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.15; Wed, 16 Feb 2022 20:52:05 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::3e) by BN6PR11CA0051.outlook.office365.com
 (2603:10b6:404:f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Wed, 16 Feb 2022 20:52:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Wed, 16 Feb 2022 20:52:04 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 14:52:03 -0600
Date: Wed, 16 Feb 2022 14:51:44 -0600
From: Michael Roth <michael.roth@amd.com>
To: Markus Armbruster <armbru@redhat.com>
CC: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Adding a handshake to qemu-guest-agent
Message-ID: <20220216205144.apr4vxptm6imilbm@amd.com>
References: <CAFn=p-anWO3dpvcECpW6J1ExJLw01DhXvTYtC5FUi5p7kQ2tig@mail.gmail.com>
 <87pmnwqzq7.fsf@pond.sub.org>
 <CAFn=p-YVdQDbzUsQm97=FyuZN_m3jCsFzjTpguRPjtH3PezTMg@mail.gmail.com>
 <87zgmze0im.fsf@pond.sub.org>
 <CAFn=p-b-gfeDgFfivtJ6tOixyydRb1kS8rS+H41RjiVZ-3Sgsw@mail.gmail.com>
 <87czjpilgy.fsf@pond.sub.org>
 <20220215193601.7bfexzqnpsprjg2t@amd.com>
 <87zgmr89a3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zgmr89a3.fsf@pond.sub.org>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20587d73-8f6d-473e-b08a-08d9f18e2fec
X-MS-TrafficTypeDiagnostic: DM4PR12MB6012:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB60124C79A2AC7A75F44F475695359@DM4PR12MB6012.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jBykyALmyIsGokSIylv9edhXBEtTK5rexLm+iqXNbYXCURTxz0Ux+V+CgNHj2OGwAWr9yAbZ5maPrZz74dyB++psWy+PwzhDyrlHGgTHXQXpOOJKylgIAspYbcKdYzCFUpLvlYDcotLS5qFJbT9VLQElG4EXJObs0aQNDNpu6cAQPbFjywQy0eg6gMf2nZjDbCt+uUi5NIN9ZCeoiFJF7/LBch4ermjq4XOqFSevUg+O4/oTtJbn6LpJKJ70vPD4fnnA+bAWd+AdNI5Qmox5tnZYg6vp4Y+BnZX8egApEMgSdkxDzKGugzEDOGM6DEPpk0OBNYUh1hVfftjiAo/bAwAwIfGiY/vAhVuwXqVaP0DtRe8V0Ptz417XPOf0r5WLR1c7k+lAoyGSHfFCziKZQUnNzRlnCBfz/uNjGf2jcPKFCQB5iDzRFJaTUvmmYkVgRSElrRtXMTQ2kaB/22DBANpPvvzii9AOhNd405f9H5A4nJAZyY/ddvV3HGvFV25YnJvY8/WzkZa0UToEl0x2s4teCrHciARLtvz7LHkFCo/KNoK7hES6TghrCbP8fXIe9kRzIgrN9JgCYYizG7vRwz/+h8G/LuzmQE6EdwbZBpYg0o+Fx2zphyaXDQrIRiJo7lVc2eFdf+ympoAvF9aJrXyRHWoYoZTg+cBTRzTRgcVwQctmb1AnWc0lo69A7AkxxjpDNQXTMyeNctG/0wo9iw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(508600001)(336012)(54906003)(40460700003)(86362001)(81166007)(36756003)(6666004)(16526019)(26005)(1076003)(2616005)(8676002)(186003)(426003)(5660300002)(2906002)(4326008)(36860700001)(44832011)(47076005)(83380400001)(8936002)(70586007)(316002)(70206006)(82310400004)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 20:52:04.0701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20587d73-8f6d-473e-b08a-08d9f18e2fec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012
Received-SPF: softfail client-ip=40.107.92.43;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On Wed, Feb 16, 2022 at 10:12:36AM +0100, Markus Armbruster wrote:
> Michael Roth <michael.roth@amd.com> writes:
> 
> > On Mon, Feb 14, 2022 at 03:14:37PM +0100, Markus Armbruster wrote:
> >> Cc: the qemu-ga maintainer
> >> 
> >> John Snow <jsnow@redhat.com> writes:
> >> 
> >> > [Moving our discussion upstream, because it stopped being brief and simple.]
> >
> > Hi John, Markus,
> >
> >> 
> >> Motivation: qemu-ga doesn't do capability negotiation as specified in
> >> docs/interop/qmp-spec.txt.
> >> 
> >> Reminder: qmp-spec.txt specifies the server shall send a greeting
> >> containing the capabilities on offer.  The client shall send a
> >> qmp_capabilities command before any other command.
> >> 
> >> We can't just fix qemu-ga to comply, because it would break existing
> >> clients.
> >> 
> >> We could document its behavior in qmp-spec.txt.  Easy enough, but also
> >> kind of sad.
> >
> > I'm not sure we could've ever done it QMP-style with the initial
> > greeting/negotiation mode. It's been a while, I but recall virtio-serial
> > chardev in guest not having a very straight-forward way of flushing out
> > data from the vring after a new client connects on the host side, so
> > new clients had a chance of reading left-over garbage from previous
> > client sessions. Or maybe it was open/close/open on the guest/chardev
> > side that didn't cause the flush... anyway:
> >
> > This is why guest-sync was there, so you could verify the stream was
> > in sync with a given "session ID" before continuing. But that doesn't
> > help much if the stream is in some garbage state that parser can't
> > recover from...
> >
> > This is why guest-sync-delimited was introduced; it inserts a 0xFF
> > sential value (invalid for any normal QMP stream) prior to response that
> > a client can scan for to flush the stream. Similarly, clients are
> > supposed to precede guest-sync/guest-sync-delimited so QGA to get stuck
> > trying to parse a partial read from an earlier client that is 'eating' a
> > new request from a new client connection. I don't think these are really
> > issues with vsock (or the other transports QGA accepts), but AFAIK
> > Windows is still mostly reliant on virtio-serial, so these are probably
> > still needed.
> 
> I believe you're right about the reason being virtio-serial.  I
> documented it that way in commit 72e9e569d0 "docs/interop/qmp-spec: How
> to force known good parser state".
> 
>     2.6 Forcing the JSON parser into known-good state
>     -------------------------------------------------
> 
>     Incomplete or invalid input can leave the server's JSON parser in a
>     state where it can't parse additional commands.  To get it back into
>     known-good state, the client should provoke a lexical error.
> 
>     The cleanest way to do that is sending an ASCII control character
>     other than '\t' (horizontal tab), '\r' (carriage return), or '\n' (new
>     line).
> 
>     Sadly, older versions of QEMU can fail to flag this as an error.  If a
>     client needs to deal with them, it should send a 0xFF byte.
> 
>     2.7 QGA Synchronization
>     -----------------------
> 
>     When a client connects to QGA over a transport lacking proper
>     connection semantics such as virtio-serial, QGA may have read partial
>     input from a previous client.  The client needs to force QGA's parser
>     into known-good state using the previous section's technique.
>     Moreover, the client may receive output a previous client didn't read.
>     To help with skipping that output, QGA provides the
>     'guest-sync-delimited' command.  Refer to its documentation for
>     details.
> 
> 0xFF is invalid UTF-8, which is kind of icky.  We should've used a
> proper control character like EOT (end of transmission) from the start.
> Water under the bridge.
> 
> guest-sync has another design flaw: an unread command reply consisting
> of just an integer can be confused with guest-sync's reply.  Unlikely as
> long as guest-sync's @id argument is chosen at random, as its
> documentation demands.
> 
> guest-sync could be deprecated, I guess.  

Yes, should probably be deprecated in favor of guest-sync-delimited. I
left it for clients that really don't want to dig into the transport
layer to search for 0xFF, but still want at least some ability to
re-sync.

> 
> The @id argument of guest-sync and guest-sync-delimited feels kind of
> redundant with the command object's @id member.  Except QGA didn't
> conform to the QMP spec until commit 4eaca8de26 "qmp: common 'id'
> handling & make QGA conform to QMP spec" (v4.0.0).  More water under the
> bridge.
> 
> Note that there's no need for all this when the transport provides
> proper connection semantics.  Clients relying on connection semantics
> work fine even when they don't bother with this syncing stuff.  Do such
> clients exist?  We probably don't know.  May or may not matter.

True, I think only virtio-serial and maybe isa-serial require the sync.
I was hoping virtio-vsock might quickly become the default, then most
clients would no longer need guest-sync*, but Windows still seems to be
reliant on virtio-serial (AFAIK).

> 
> > So QGA has sort of always had its own hand-shake, ideally via
> > guest-sync-delimited. So if this new negotiation mechanism could
> > build off of that, rather than introducing something on top, that would
> > be ideal. Unfortunately it's naming isn't great for what's being done
> > here, but 'synchronize' is sorta in the ball-park at least...
> 
> Fair point.
> 
> >> Is there a way to add capability negotiation to qemu-ga without breaking
> >> existing clients?  We obviously have to make it optional.
> >> 
> >> The obvious idea "make qmp_capabilities optional" doesn't work, because
> >> the client needs to receive the greeting before sending
> >> qmp_capabilities, to learn what capabilities are on offer.
> >> 
> >> This leads to...
> >> 
> >> > What about something like this:
> >> >
> >> > Add a new "request-negotiation" command to qemu-guest-agent 7.0.0.
> >> >
> >> > [Modern client to unknown server]
> >> > 1. A modern client connects to a server of unknown version, and
> >> > without waiting, issues the "request-negotiation" command.
> >> > 2. An old server will reply with CommandNotFound. We are done negotiating.
> >> > 3. A modern server will reply with the greeting in the traditional
> >> > format, but as a reply object (to preserve "execute" semantics.)
> >> > 4. The modern client will now issue qmp-capabilities as normal.
> >> > 5. The server replies with success or failure as normal.
> >> > 6. Connection is fully established.
> >> >
> >> > [Old client to unknown server]
> >> > 1. An old client connects to an unknown version server.
> >> > 2. A command is issued some time later.
> >> >   2a. The server is old, the command worked as anticipated.
> >> >   2b. The server is new, the command fails with CommandNotFound and
> >> > urges the use of 'request-negotiation'.
> >> 
> >> A new server could accept the command, too.  This way, negotiation
> >> remains optional, unlike in "normal" QMP.  Old clients don't negotiate,
> >> and get default capabilities.
> >
> > ...so what if we had guest-sync/guest-sync-delimited start returning
> > capabilities and version fields rather than a new request-negotiation
> > command? If they aren't present we know the server is too old, and don't
> > have to rely on CommandNotFound to determine that.
> 
> Both guest-sync and guest-sync-delimited have a design flaw that defeats
> such a straighforward extension: 'returns': 'int'.  There is no way to
> return more data compatibly.

Ugh, I misread the scheme and thought it was a struct with a single
field... I knew that seemed to good to be true.

> 
> We could add an optional flag to guest-sync-delimited to make it return
> an object.  But I think we'd be better off with a new command.

New cmd is probably for the best then, since hopefully guest-sync-delimited
can become irrelevant in the future, and the possibility of a failed sync
command on old clients (due to new param) getting mixed in with the recovery
logic for a failed negotiation/capability probe, would probably make the
whole interface a bit too unwieldy.

> >> > - QGA is now officially on a different flavor of QMP protocol. You
> >> > still need to know in advance if you are connecting to QGA or anything
> >> > else. That's still a little sad, but maybe that's just simply an
> >> > impossible goal.
> >> >
> >> > Bonus:
> >> > - If an execution ID is used when sending "request-negotiation", we
> >> > know that the server is at least version 4.0.0 if it responds to us
> >> > using that ID. A modern client can then easily distinguish between
> >> > pre-4.0, post-4.0 and post-7.0 servers. It's a useful probe.
> >
> > Is that in reference to the optional 'id' field that can be passed to
> > QMP requests? Don't see the harm in that, and QGA should pass them back
> > intact.
> 
> I think it does since commit 4eaca8de26 "qmp: common 'id' handling &
> make QGA conform to QMP spec" (v4.0.0).

Ah, right, sort of remember now. Thanks for the pointer.

-Mike

