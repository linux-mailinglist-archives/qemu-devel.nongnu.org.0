Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE4636F192
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 23:09:42 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcDun-0007Iq-BY
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 17:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lcDt9-0006fC-HK
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 17:08:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lcDt5-0007FI-8B
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 17:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619730473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGSyB1X9hUns5asnx94ZW39+gZQD2MJykOVYdEhlrrQ=;
 b=FbkJwmL6MvlAKmFxqbQUDLwq+MG5e6YAFl7+w6cisYGSC4KfPoWEszvy8PSqfu8eA8QNi8
 f68v3eY1qsb/SzBR+zFbmeVaZF7XoEBe+lUB8aBKllyliGsJ84Qrn0pNHB/a/hbZDYcjEN
 9uHsP6wSdQmgnbKMb50qxMh07LKmfn8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-b8TBwvG6M6KPYk0kf2s_rw-1; Thu, 29 Apr 2021 17:07:51 -0400
X-MC-Unique: b8TBwvG6M6KPYk0kf2s_rw-1
Received: by mail-qk1-f198.google.com with SMTP id
 s10-20020a05620a030ab02902e061a1661fso28911481qkm.12
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 14:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AGSyB1X9hUns5asnx94ZW39+gZQD2MJykOVYdEhlrrQ=;
 b=T+kk4n000KhpUk5N74GmYRl5/gEaOblAfQi3tO6qCVhQhI4KTUJmsA5QCH1fAxyAag
 BmTVPWQcMsRKethtObtvebv0iiAD44DtPFWh3gdwyBCxUdcJeUOLlZVlQkqwmETY6gj/
 Bzidm7q2xYe+25l3Jgw0mDOLX9y1Qnq3yH9hm8tfqpv4mkVRCZodC6ukG/ZEucpp0ItK
 cTEm4CnZM/euDtFe95dQDoDNc1cmABFozhn3+YqSvoc7B3NVXREuKoQDPk+Ao8Gpd0Ft
 zW/iNY3SYR4M8gmMn7oPrypbMQbog57HK+gghmvTm4XrkwUAVmWmC1mbrZEwHc3J83jB
 +MZw==
X-Gm-Message-State: AOAM531Es7rgD44yqXbaTqIc9LReqP19qw9xgH+B+L0w13RnlV7p9jNf
 olfMJdnJ1qxY7M+VtB1IkGxbp1BBGmCWZrKDwPI4lVab3YJdEfi9aXneW2PiJpSYQ4tb6Usdoy6
 M9Et3Ww1vpwa3J6eBB2YrayVECPxMmpQJR3Erdq7jlbRMJAbmz/dGpEyrkPL/AO1J
X-Received: by 2002:a05:622a:1049:: with SMTP id
 f9mr1423894qte.140.1619730470665; 
 Thu, 29 Apr 2021 14:07:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1wbhPFpcXEW57lK2p6GeFj3dXjQ02cZWcmBH9pCcrY4MylVTPhBuPjrcTud+Fr6PS+vrFHQ==
X-Received: by 2002:a05:622a:1049:: with SMTP id
 f9mr1423868qte.140.1619730470330; 
 Thu, 29 Apr 2021 14:07:50 -0700 (PDT)
Received: from xz-x1
 (bras-base-toroon474qw-grc-77-184-145-104-227.dsl.bell.ca. [184.145.104.227])
 by smtp.gmail.com with ESMTPSA id 19sm2995358qkg.54.2021.04.29.14.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 14:07:49 -0700 (PDT)
Date: Thu, 29 Apr 2021 17:07:48 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/10] KVM: Dirty ring support (QEMU part)
Message-ID: <20210429210748.GG8339@xz-x1>
References: <20210324183954.345629-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210324183954.345629-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 02:39:44PM -0400, Peter Xu wrote:
> This is v6 of the qemu dirty ring interface support.
> 
> v6:
> - Fix slots_lock init [Keqian, Paolo]
> - Comment above KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 on todo (to enable
>   KVM_CLEAR_DIRTY_LOG for dirty ring too) [Keqian, Paolo]
> - Fix comment for CPUState [Keqian]

Ping after v6.0 released (seems still ok to apply).

-- 
Peter Xu


