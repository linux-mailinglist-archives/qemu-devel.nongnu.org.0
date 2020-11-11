Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72FF2AEF36
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:09:46 +0100 (CET)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kco0X-0003hw-VD
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnyi-00035w-8o
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:07:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcnyf-0001yO-5N
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605092867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7L2GRJXI07EDAF0bOuF973EODG4wdqjxtktCHkpE8F0=;
 b=QVC/fP80cCdtPcLVWS0beNMSuojihH4+8Jkt2DTqg3fBehPI6bR3u8F/IM2slAItqoPriM
 Cplc9VcHe7C5Z04JyqxuYxFyxVPIhJmG3HZiQtRsPh2EuKMaUmev931vwMJW1Gs6ZCFBwM
 8g6ouV3p1sTVWHoUiAfSrRM8A8jM5n4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-b1WFbLsYPayZY7QHDt0uww-1; Wed, 11 Nov 2020 06:07:46 -0500
X-MC-Unique: b1WFbLsYPayZY7QHDt0uww-1
Received: by mail-ed1-f69.google.com with SMTP id b68so718017edf.9
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 03:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7L2GRJXI07EDAF0bOuF973EODG4wdqjxtktCHkpE8F0=;
 b=jz66hGa5N9Ddh7V6EkKX4tSQOp7BBZ23XTchhmAQbfA9ZyFDfF/WzohPpI9F14oPxr
 XHKVlev+GDFYlt4XzXtgQb4U/u3RulWzRTTFSKyBcTdemNh7iMGaFcbeIBgrE1ellHy0
 wq/9g/upCJ3UFmuMWUPMx5H3Q7wCLQZhDCh8nYSKuU201NUk7ALqanZTy3ECHYZuu5xT
 itErybE4Na67dA0o2ahACXzch5hdyX1oWA8kI8KyK5+MdcAezHnAFcMyurmBufieqvd/
 OPGoFR/LdCLlUqg16A1jktetQJTT9Pdcdene0igO0KrsKSKNXh3jVVVEMrnCH1i3ytwA
 vaSQ==
X-Gm-Message-State: AOAM533Oo9ZQi5aj8ph15hPjaInaJwHwl8ou9GXHwAqQ0KN/NnqF/d1M
 Gpju/EpdsEMrjx26sDX8mXBGbnIBxNjmNX88/ke9NJpRycX6nmiTA5xiSYNdrBtJax2rLw32kiu
 3DADUMbX23+cULsY=
X-Received: by 2002:a17:906:4698:: with SMTP id
 a24mr25761661ejr.90.1605092864611; 
 Wed, 11 Nov 2020 03:07:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXU8IpBYHIXZDiV+9Vm9e1WnlhqclYJDKj3yJmquAY37PdoqIIlPPIsMcF3lDsfL22dyKcrA==
X-Received: by 2002:a17:906:4698:: with SMTP id
 a24mr25761646ejr.90.1605092864454; 
 Wed, 11 Nov 2020 03:07:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n7sm740250edb.34.2020.11.11.03.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 03:07:42 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20201111092423.GA3898@merkur.fritz.box>
 <20201111101407.GD906488@redhat.com> <20201111103550.GB3898@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
Message-ID: <30bdf162-5b29-6725-f5a5-fb5dcc85abee@redhat.com>
Date: Wed, 11 Nov 2020 12:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111103550.GB3898@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 11:35, Kevin Wolf wrote:
>> IOW, I'd suggest we focus effort on introducing the new config file format
>> based on QAPI first, and once that exists, then convert these sample
>> config files in docs/config, and deprecate -readconfig.
>
> Fine with me. That would make introducing the new config file format a
> priority, though, even if it can't support every option yet (similar to
> -readconfig). I didn't have the impression so far that we are planning
> to do that. Is anyone working on it?

Indeed, my plan was to focus on QMP-based configuration, not on 
configuration file formats.

However I hit the same snag, in that my patches broke -readconfig for 
-object, -M and -accel.  I'm thinking of decoupling config file parsing 
from QemuOpts, using QDicts instead and moving the QemuOpts part into 
softmmu/vl.c.

Paolo


