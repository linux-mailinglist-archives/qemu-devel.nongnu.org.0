Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86F2688C5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 11:49:53 +0200 (CEST)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHl7Q-0000tn-CK
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 05:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kHl6c-00004s-0J
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 05:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kHl6Z-0004LP-Uf
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 05:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600076938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKCQvv4olS/jftVON9QpHJLp5RaX15eBN/cq3w77xWw=;
 b=jLLCLnMkNGMRg2EGZwRaI69t9p2nlIjbJ5hOIbCtNEpHY7fohrPdMu68gW1j4eR8jrnDwo
 P3nxOBGdPx6888tjZgxaq5kZQWtGZII9ipuXFIhv8nJis8jbffBpCLtKaal4YvnvAU6kwn
 b9I4QxRgnplsYgbNsVdE0YmzRb0qBog=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-rDpN-sSSNHaAk2_eP2VYPg-1; Mon, 14 Sep 2020 05:48:56 -0400
X-MC-Unique: rDpN-sSSNHaAk2_eP2VYPg-1
Received: by mail-wm1-f69.google.com with SMTP id c200so1026258wmd.5
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 02:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=suq82GH4prItMy1jLuehLUqN1oelq8XPLzaNg0VZDjQ=;
 b=Qrcf9suIOwjaocus/tiFUAi3vooU+uIZU4KPYeQNht44vcvwfvauEHBsZT1AXa4MG/
 gaXUvyBAczkhKBsiNQMhMJLdl/IbQqMIgT+acBOggM12iDJmh7zBqhN/gsJMtA4GkPfD
 X/prEVhD2Jeubcf/SGQGWqsXW+V9a/EiOXBQQQBYTb7tBLr9+LomtUp4+8Zn40xQTH+r
 b+Y2Rv6yDxM5eIJyFcG+uuPf/XQrA+rcxG5zySvhaLrjzX+T8+9nod+MpuJy317YMnGk
 SSrE5UvMuBuoOXrOpBTO48TCmXAGmURwT76ufbovnS3AyJ0fRlMNNv2WrC9eJfZ5Iyv4
 RhZg==
X-Gm-Message-State: AOAM531XyKCz26dAXcI79gk+G+HcxlKROrmS6ws3n4fvtCbSm7K0x3MF
 SBQuvylkl/ZUI4WqkNjwPjlEfrmSI039OVR14aRSLv7N/X2V3SCl5+RxVmJ4I2H0vHhkFGvuvAi
 xN+Zl0ip20+EiUHE=
X-Received: by 2002:a05:6000:1c8:: with SMTP id
 t8mr14947301wrx.3.1600076935302; 
 Mon, 14 Sep 2020 02:48:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvkSwAayb4HDw1ZnK4qPAU94GJvfyAKb+Ztj/gnLImWVmBOs0X9LwW3mGNypKC81vce6dnmw==
X-Received: by 2002:a05:6000:1c8:: with SMTP id
 t8mr14947285wrx.3.1600076935110; 
 Mon, 14 Sep 2020 02:48:55 -0700 (PDT)
Received: from ?IPv6:2a09:80c0:192:0:d9bf:c7fe:b02e:7d05?
 (w3b7iqsg102lfp-v6.eduroam.dynamic.rbg.tum.de.
 [2a09:80c0:192:0:d9bf:c7fe:b02e:7d05])
 by smtp.gmail.com with ESMTPSA id 2sm12412577wmf.25.2020.09.14.02.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 02:48:54 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 3/8] qapi: Restrict balloon-related commands to machine
 code
Date: Mon, 14 Sep 2020 11:48:53 +0200
Message-Id: <CD01CCE8-2E17-4234-82E8-37DE94E62DD3@redhat.com>
References: <b9401e89-2598-74f7-5e92-885c522b7599@redhat.com>
In-Reply-To: <b9401e89-2598-74f7-5e92-885c522b7599@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: iPhone Mail (17H35)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 14.09.2020 um 11:42 schrieb Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>:
>=20
> =EF=BB=BF+Laurent and David
>=20
>> On 9/14/20 11:16 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Only qemu-system-FOO and qemu-storage-daemon provide QMP
>>> monitors, therefore such declarations and definitions are
>>> irrelevant for user-mode emulation.
>>>=20
>>> Restricting the balloon-related commands to machine.json
>>> allows pulling less declarations/definitions to user-mode.
>>=20
>> How this affects user mode is not obvious to (ignorant) me.  Can you
>> provide a clue?
>=20
> I guess this was discussed with David at some point.
>=20
> Maybe the QMP commands are not exposed via HMP, making this
> code unreachable?
>=20
> Anyhow user-mode binaries don't use the memory ballooning feature,
> this is specific to system-mode emulation.
>=20
> Laurent/David, do you have some more trivial explanation?

Agreed.

No memory ballooning device -> no memory ballooning :)

>=20
> Thanks,
>=20
> Phil.
>=20


