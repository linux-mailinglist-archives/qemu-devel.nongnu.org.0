Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53F5B3CD2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 18:17:53 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWghU-0001RL-Ou
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 12:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWgbO-0004fy-Hm
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWgbL-0003Yl-HZ
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662739890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3V6tkMbDHWGuzpmv2iezKHnhh6C6Gq7prSLGElxdlvo=;
 b=P/xSen+tDwMnbk+Ziz0Tta/v8s2Ouv72zfGUd+96OWWBvcnlYTLeBhMdsgEMaqBnbCVny5
 WPdvcNeqjZwS7fqPZMlSgAKT7WZcyd4AIDyjTUmKzq5YrWTpHQUdL3QOoKOmV13zlNxjB1
 At2pTGpSjuMvKgkRj+H1iCEvZnMPQHg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-SXCNu01rMvS9Nasg1wmLTQ-1; Fri, 09 Sep 2022 12:11:29 -0400
X-MC-Unique: SXCNu01rMvS9Nasg1wmLTQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 ff27-20020a05622a4d9b00b0034306b77c08so1867918qtb.6
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 09:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=3V6tkMbDHWGuzpmv2iezKHnhh6C6Gq7prSLGElxdlvo=;
 b=8FafLtOrKOSGUqpGxd8XiB3+BvmROnMUnajYRNz0WhE+0+MUL2MvYMeI++Slgx9Sl/
 CjC+/eHEA1LfokAj6ec34BtFFZQ10JkQte3jfzLixkLR488ALOtMZXuLG/ErEJJXqdZt
 V61IsRXa7rprmYtWpgYJy/+y+0ig0EGPSERsayRlkc0UNw6TQGKRmcu1OPe70jJ4Gd2S
 NwVJySB/KKxFFGHdAqfwKb9kX6AkZxoSU1pELOM/CmjvqheYrM9ZsW3j5duJazEwd2wb
 +Ci+Wkq6UuZtPYHyJ4uFWSiaVH8IGpY6QQzRv5Jxhk1vqCUNkmC7OxaZYQRoEY+LhFOB
 21jA==
X-Gm-Message-State: ACgBeo1KvOcgtJqIFd+gep1sGKoRVTs7VgRXh2fK7euBC9je1i4Y8Pex
 IqyqtoWJZuKUMgpg1fq23VjlhiHT/cCBXIKBrLUb+G8xlglPqqYehhjJ/d4CEd87uitUA9+VMm9
 wn+9Av+Le4meDGEk=
X-Received: by 2002:ae9:efc9:0:b0:6cb:e321:12fb with SMTP id
 d192-20020ae9efc9000000b006cbe32112fbmr4471709qkg.446.1662739888728; 
 Fri, 09 Sep 2022 09:11:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5I/ZBXZqE/p/fxuOPwWRewlB64ZKE33b/09QagZNajnZGs5vQ07ecFEBFyECMoWo6epJE49Q==
X-Received: by 2002:ae9:efc9:0:b0:6cb:e321:12fb with SMTP id
 d192-20020ae9efc9000000b006cbe32112fbmr4471665qkg.446.1662739888064; 
 Fri, 09 Sep 2022 09:11:28 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a37ab16000000b006b633dc839esm693063qke.66.2022.09.09.09.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 09:11:27 -0700 (PDT)
Date: Fri, 9 Sep 2022 12:11:26 -0400
From: Peter Xu <peterx@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v5 2/3] i386: kvm: extend kvm_{get, put}_vcpu_events to
 support pending triple fault
Message-ID: <YxtlrnOYFwGTLHwL@xz-m1.local>
References: <20220817020845.21855-1-chenyi.qiang@intel.com>
 <20220817020845.21855-3-chenyi.qiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220817020845.21855-3-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 17, 2022 at 10:08:44AM +0800, Chenyi Qiang wrote:
> For the direct triple faults, i.e. hardware detected and KVM morphed
> to VM-Exit, KVM will never lose them. But for triple faults sythesized
> by KVM, e.g. the RSM path, if KVM exits to userspace before the request
> is serviced, userspace could migrate the VM and lose the triple fault.
> 
> A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
> the event.triple_fault_pending field contains a valid state if the
> KVM_CAP_X86_TRIPLE_FAULT_EVENT capability is enabled.
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


