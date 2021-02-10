Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3FB316DEA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 19:07:26 +0100 (CET)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ttd-00071j-Pc
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 13:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1l9tnx-00033P-E2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:01:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1l9tnu-00052E-Cd
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612980086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fV/7Hew8NiidRHt4HjrCctY8CCTSfxykh9CdQGsocZY=;
 b=De6xm5oa+cONNRQSnddPaTKF+Vx1w/4ixDt4uyQ+0K9JSCoIjOOrpRxhVrAIiN7uVRs8g2
 V4mCeT9PNIy5OiENICSIEDaoQw99BzkondjDr57ajpcOPOUczvj4kVqibRzY5FcGDNhp41
 oKNpHTHhPTENfJgv/mrT9bxnLPsrBeI=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ZjZF2MmqNlqiTKKSoUP7Dg-1; Wed, 10 Feb 2021 13:01:16 -0500
X-MC-Unique: ZjZF2MmqNlqiTKKSoUP7Dg-1
Received: by mail-oo1-f72.google.com with SMTP id g21so1173624ooa.8
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 10:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=fV/7Hew8NiidRHt4HjrCctY8CCTSfxykh9CdQGsocZY=;
 b=DE2gtNmvVHtGdKRpsBPjMgrrvMtCug32VIUhzexIF9NxrqIvRUtJskvfDAL6Ganqyu
 sR/LbMaheyUNNalDfYRyAEMUKc8OWLYo+o1S2T3/7xvWqAdmo+ke5NxyMDbPRTC+YuPt
 mQm/epSMp6cGS8EPHEz9MG+9JQbmT7smi+qtSdqHBLTtcA0Fg3+m5IHQyHuTkvCIojHw
 4dZZpBIL8hN56TPOqxMygHfSn5fp31leEOMTwS70dLvU36NaBaHz3dOyl7e4kgwKWl7v
 +bAUCWIKCJsSAZi3a2NNhjy+mBL9rXEAWmW4CZn4EAkjPHxrUX2H/7e6rkHYDz4qwzcZ
 luvw==
X-Gm-Message-State: AOAM533KOHeXDDmqjl++bGDdvIUQ432mIeUYh/sk/26epgxEzYcIUZP/
 a0WyFNbXIjqTkpWsIkwdpZzCBFZa7YBjzHyzdgGOLANUO+0Kj78P+2vwFCQHt6+DqwnnTds2ckw
 xyOqabfu1u8Awluk=
X-Received: by 2002:aca:ef84:: with SMTP id n126mr66120oih.109.1612980073115; 
 Wed, 10 Feb 2021 10:01:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh3p2Qy3iyqaP6QYFdJcnOQRRLzZO3e1UZfQZX5U/K4Fa42JlL8ovY4fL7H0So5dZmMKDb8A==
X-Received: by 2002:aca:ef84:: with SMTP id n126mr65974oih.109.1612980071256; 
 Wed, 10 Feb 2021 10:01:11 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 s189sm583738oif.19.2021.02.10.10.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 10:01:10 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Interactive launch over QMP socket?
To: qemu-devel@nongnu.org
Message-ID: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
Date: Wed, 10 Feb 2021 12:01:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jejb@linux.ibm.com, npmccallum@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Does QEMU have an internal API which would allow VM construction to wait 
at a *very specific point* until specific data/QMP message(s) are 
supplied via the QMP socket?

For some additional context: QEMU supports launching AMD SEV-protected 
guests; in short: encrypted virtual machines. Guest owners may 
participate in attestation to cryptographically verify their assumptions 
about the guest's initial state, the host's platform, and the host 
platform owner's identity. If the guest owner is satisfied with the 
attestation process, a secret can be safely injected into the guest's 
address space over a secure channel.

Attestation is an unavoidably interactive process.

It appears that QEMU already exposes most of the API required to perform 
this attestation remotely with a guest owner over QMP, with only one 
exception: starting the attestation session. It looks like the session 
components (policy, session-file, and dh-cert-file) are supplied via 
command line arguments to QEMU and don't have a message type in the QMP 
spec:

	-object 
sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x1,session-file=blah.session,dh-cert-file=guest_owner.cert

I would like to add a message type to QMP which allows guest owners to 
supply this data over a socket and _not_ require these components a 
priori via command line arguments. In doing so, this would allow for a 
100% remote attestation process over the socket. However, I'm not sure 
how to express this interactive "waiting" for this data to become 
available with internal APIs (assuming it's not supplied as a command 
line argument).

For example, in order to accomplish a 100% remote attestation:

Somewhere in between sev_guest_init() and sev_launch_start(), the guest 
owner may send the following messages:

1. "query-sev" to collect important information about the platform state

2. "query-sev-capabilities" to independently verify the platform 
certificate chain and derive a shared secret for establishing a secure 
channel with the AMD SP.

3. "sev-launch-start" this is the only message that I think is missing 
from the QMP message types for remote attestation. This is how the guest 
owner would deliver the session components over the socket instead of as 
command line arguments.

Then, sometime before the VM is launched and is running, the guest owner 
may send:

4. "query-sev-launch-measure" to compare its measurement against the AMD 
SP's measurement

5. "sev-inject-launch-secret" if happy with attestation, securely 
deliver secrets

6. Guest owner could send a "cont" command and the VM can launch

Any advice on how to accomplish adding this degree of interaction to 
supplying inputs to specific parts of the launch process this is greatly 
appreciated.

Thank you,

Connor

QEMU QMP Reference Manual: 
https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html


