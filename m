Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCD45CCD2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:12:32 +0100 (CET)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxh1-0000YQ-Gd
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpxdp-0006nH-Jf
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:09:13 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:50587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mpxdm-0007Jq-3v
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=shYgg4HT5fxej04RHDTZEl5nXX8tPmfKbZ2S+1vmXCU=; b=uBqDl7y832PWCvsLJlYgJ4hJNk
 dEPhsASRUl4CQ+4DH74ntZpYLtlaHAx/pqcOtTUXtEsHAGF0VsfOrui4fUX6TgpiqNWp+FbfKaPMs
 aurogvUukxYN91Jco3T1ydqs6mMa/v0fcsSDuEi0i5xvjMqv4Riz4nJEtaGmc4pZ5UkGjXF56ZusX
 Cegk6OxGKgThWEpzo56OW5lbTutLBWen/hVzjr+Q67mZCqCExnr6YRksvPHKaxXi5N2f70KJ/S5Su
 Gv9I8R36owCFUyUdroweXdkyGW7e7OVlRbWrYIEhi7TcJHur77d7MT2EMWVa7QoH8O+M2B7AGnh3K
 KCeGHaqiudv90Lu6LBWKf3hP9BB5AvZfV5mHsuy6CjqwzabzQazMq447SydMOVR4fvtqxPCMUOppH
 +cUSavWI+6ZjXp5gtnW5T8zxdGcSnM/KugrQLq9GOrfxc4+vAObYn5+eUb02K3Lffk0ew8n7sgTGR
 SJVTWfXsjqtdtOVPir9tYzphTfzJeWlLY0erfg/Wyy+D3PQeAZIe2VBg5EG1zaNAJ1Kt1E40PyYGs
 pyG0MoliH7Tnc2OX+LnS1KgSMW28TAAXHF/AbaLlBSLnkDi5Smz7dv7286ORv1UhzPTFN7FN15H24
 V0oJnND0SApiWabCEnsIvplEF0c3pL1HVSeJ/PtAE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is
Subject: Re: [PATCH v2 04/11] 9p: darwin: Handle struct dirent differences
Date: Wed, 24 Nov 2021 20:09:01 +0100
Message-ID: <1746653.fRNRREnWfK@silver>
In-Reply-To: <2B4D46DD-074E-4070-BAF0-AADAD1183B33@icloud.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <60659730.p4icJFLGV9@silver>
 <2B4D46DD-074E-4070-BAF0-AADAD1183B33@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 24. November 2021 16:45:30 CET Michael Roitzsch wrote:
> Hi,
> 
> > Are you sure d_seekoff doesn't work on macOS?
> 
> I just tried on an APFS volume on macOS Monterey and d_seekoff is always 0,
> while telldir() outputs useful values.
> > Because using telldir() instead
> > is not the same thing. Accessing d_*off is just POD access, whereas
> > telldir() is a syscall.
> 
> I am not sure this is the case. I have tried a quick test program:
> 
> #include <dirent.h>
> 
> int main(void)
> {
> 	int result = 0;
> 	DIR *dir = opendir(".");
> 	while (readdir(dir)) {
> 		result += telldir(dir);
> 	}
> 	closedir(dir);
> 	return result;
> }
> 
> I ran it with 'sudo dtruss ./test', which should give me a trace of the
> system calls. The relevant portion is:
> 
> open_nocancel(".\0", 0x1100004, 0x0)		 = 3 0
> sysctlbyname(kern.secure_kernel, 0x12, 0x7FF7BE49810C, 0x7FF7BE498110,
> 0x0)		 = 0 0 fstatfs64(0x3, 0x7FF7BE498110, 0x0)		 = 0 0
> getdirentries64(0x3, 0x7FF4A5808A00, 0x2000)		 = 1472 0
> close_nocancel(0x3)		 = 0 0
> 
> The directory has more than 30 entries, but the loop does not appear to
> cause individual system calls. Instead, readdir() and telldir() appear to
> be library functions powered by this getdirentries64 syscall.

Right, telldir() is part of Apple's libc, no (fs) syscall involved:
https://opensource.apple.com/source/Libc/Libc-167/gen.subproj/telldir.c.auto.html

However instead of changing the (fs driver independent) 9p server [9p.c] code
and using fidp there, I would probably rather address this issue for macOS in
the individual fs drivers [9p-local.c, 9p-synth.c, 9p-proxy.c] directly on
dirent instead, and not rely on fidp not having mutated on server.

And please make sure the 9p test cases pass.

Best regards,
Christian Schoenebeck



