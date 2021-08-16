Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC593ED9F6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:36:44 +0200 (CEST)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFefK-0001Ho-Qh
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFee3-0000GO-JV
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFee0-00042i-Cf
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629128118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noFeB24OdQiLhD5SCxuDOZthRsY3LsTrzo8+2vblPZ0=;
 b=dbiuBEAmymvwPOf5xXkresm6ws6Y1k1BBZpkZBjn9BEJR5tx5Nbb87Nxydsv5nq90EzQOU
 rhDGz1NuBJ7fE0GtE0qnZDdWrgs8N2KWnUVPU+6YUcm/N4m696BN9t7OenKclG3SUnkCC5
 uzz64BY23wjs+QIkQwNzMJ5h4dyguNQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-zpI3dYE9NMCVhAtdvgMB9g-1; Mon, 16 Aug 2021 11:35:17 -0400
X-MC-Unique: zpI3dYE9NMCVhAtdvgMB9g-1
Received: by mail-ej1-f69.google.com with SMTP id
 kf21-20020a17090776d5b02905af6ad96f02so4867024ejc.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 08:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=noFeB24OdQiLhD5SCxuDOZthRsY3LsTrzo8+2vblPZ0=;
 b=mCewBvHCHi6hTowuX2PXV11TVTBbTQn/WPdfwt3AVK4gw5GTFQlYH2abxPVjqss6vi
 ZxbiFASf4dAuyq6/2rIBi9RA5eskz8sFRAs80L0sOYalhsHIjaxSYfqnu5rorwAm/lWG
 D5XdK0P2YKTDwC/F6Ks674e0IgOjdK7bBLCCPfdLfPA/gL18Tf/GTe6Yi4mYR4N9QB+5
 nuOZPI11Gk0GjaF8xfKSDf5T63MP01Yg2p2oVQrUilnkmi/SK1rnsuIpBDDrGjRYbSja
 kwMAIzJB4sck4jlNWhj565429v3wAPV1bF43r3nPvp99yqeVtVBXLTQaoVaWdgxA/eWA
 8sDQ==
X-Gm-Message-State: AOAM532hTNTCQDRK6MTtuz9i31HZzQSksoX+PQT1DjclqtBTW7bjTq4W
 6IIQpNS9/VYNQ7+QY/Asmn6BEPgF0VAs/YUQ917QHAGJIDL+aVDJj4eKI7yVPPJxL/bFPR+UImd
 uypONYkQwcEdyKYs=
X-Received: by 2002:aa7:df98:: with SMTP id b24mr21095294edy.103.1629128116435; 
 Mon, 16 Aug 2021 08:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOyfspOGcV1f2KU/9SJ5AVADgXkpl2jWly+8p4N7XIoqaJ//SrbNXe/+DlpMcOJ6yVbwZCCA==
X-Received: by 2002:aa7:df98:: with SMTP id b24mr21095256edy.103.1629128116189; 
 Mon, 16 Aug 2021 08:35:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b5sm3820101ejq.56.2021.08.16.08.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:35:15 -0700 (PDT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <YRp09sXRaNPefs2g@redhat.com>
 <b77dfd8f-94e7-084f-b633-105dc5fdb645@redhat.com>
 <YRqBTiv8AgTMBcrw@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <182429f4-d5be-58d0-edb1-dacb63db278c@redhat.com>
Date: Mon, 16 Aug 2021 17:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRqBTiv8AgTMBcrw@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/21 17:16, Daniel P. Berrangé wrote:
> I woudn't be needed to create migration threads at startup - we should
> just think about how we would identify and control them when created
> at runtime. The complexity here is a trust issue - once guest code has
> been run, we can't trust what QMP tells us - so I'm not sure how we
> would learn what PIDs are associated with the transiently created
> migration threads, in order to set their properties.

That would apply anyway to any kind of thread though.  It doesn't matter 
whether the migration thread runs host or (mostly) guest code.

Paolo


