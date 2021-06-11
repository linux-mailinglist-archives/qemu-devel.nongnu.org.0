Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E73A3D51
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 09:37:16 +0200 (CEST)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrbj9-0004qj-Vm
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 03:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrbiG-0004A8-6P
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrbhn-0000hI-7R
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623396950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99GZxaE30Aco21kZJT/qmu8v9PSPBMjnnZey8jKx860=;
 b=M5sulDqvxXZtQVC5YbCGRvBQRfW7eowLx/YpuRhB+2A2A76NuJQmEs8o4vVFhm3bQCFK7S
 g6anh1Y4aPV3i6xXLiiDdzmhsS3Fc7cLXLDJc/z7k4NXS+Apr/jVRCgbgYKgPHpEgGydZE
 jVrwl0XNBylNT+ltGptn71WxxaMbcj8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-hWOqB9AnO9mMzDMl8iFLWw-1; Fri, 11 Jun 2021 03:35:46 -0400
X-MC-Unique: hWOqB9AnO9mMzDMl8iFLWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 g81-20020a1c9d540000b02901a3d4d3f7fcso5163621wme.2
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 00:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=99GZxaE30Aco21kZJT/qmu8v9PSPBMjnnZey8jKx860=;
 b=EQBf3cwNbW3tPCQiOP/V4xqHszjJcbNQNQfeb19eWTWhhyEdI+zowmoREqRa/2Shhc
 Q5r9HHJ9mHVSV/Y213CODNNKHd0DlmeFlTMOAb5rEqu3TW2DjST5CR97LJalWwUnmsCI
 HQ9/3Mu8ql3Z/GsSbMTOQ7qC+3hmqosOE42SEj5lPqnHmS1JQLJoBU7SfQD+TtuxeVd8
 evZLhpCHMsrtRNr+QYIeyqEOYQ2W0xfJweN3d9oiltz0IV6/UnvbknKBGNRWDi65fE9l
 o0VpTtiApLGziteLMvMZ3ogGjLq9mIK4BRlNlewtcAtMtWjwrBQYq2Q16wWqKKMIpBQ6
 As8Q==
X-Gm-Message-State: AOAM531wtrw0/cekqUGZgFVfNtKkn+uTGeyr3IiBKavsdU2vzSOkoSK+
 vZLAROEeaYvr3JF3ctCnDjKJhSDhSQgKeRg5/V3yG/PaKnXQvTt79YqVZ82Wdg9LG7EXyPv/xgQ
 dbU6eV+dPYjQSB+o=
X-Received: by 2002:adf:a15c:: with SMTP id r28mr2449314wrr.224.1623396945590; 
 Fri, 11 Jun 2021 00:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxkVYXRQbIODumn2SLTmQcMdpqRmm88iAZgwEv0neoWKAiZD3HTHpAHyXAkEv6t7XQ31+zEg==
X-Received: by 2002:adf:a15c:: with SMTP id r28mr2449295wrr.224.1623396945394; 
 Fri, 11 Jun 2021 00:35:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id k5sm5770292wmk.11.2021.06.11.00.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 00:35:44 -0700 (PDT)
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
 <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
 <b2fb96b8-415b-b2d4-168c-d43dc20ef7b6@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4dffdaf1-e7e5-cb28-7f7a-2061f182ee5b@redhat.com>
Date: Fri, 11 Jun 2021 09:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b2fb96b8-415b-b2d4-168c-d43dc20ef7b6@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, jose.ziviani@suse.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/21 15:12, Claudio Fontana wrote:
> The difficulty is that accelerator code is going to be split across a
> large number of directories.

It should be possible to use a sourceset per target; just like there is
target_arch, target_softmmu_arch, target_user_arch we can add
target_softmmu_accel_arch['i386']['tcg'].

So each module would include both accel_modules[accel] and 
target_softmmu_accel_arch[arch][accel].

Another possibility is to use a single-level of dictionaries, e.g. 
target_softmmu_accel_arch['i386'], and select files using CONFIG_* 
symbols.  That would be a bit neater but harder to implement.  It can be 
done later.

Paolo


