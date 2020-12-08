Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82A2D258E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:17:48 +0100 (CET)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYBv-0002GF-9y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmY83-0008F8-Qs
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:13:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmY80-0008Eo-W1
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607415223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQ3YYnYCSeNJFntjBuzvC1itaJ45prWp1eyYiNm6Xic=;
 b=huLhZgyZxLfcLBVwCdO+tVhMNdxP0SJtwqlfONm9e6yr+6l3376PYmz1KeF7A5unZkA0kY
 uDZf25BTbtoVEo72NodYUciL+vjHmPq45muDQObKyFkyqWfsxFG5NmKmIR4InRzeP1bhaJ
 bRAooE8V4AfTqyMtHpRpBIXOwYstVGA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-8-N4CPErPuKbVxQHthVWAA-1; Tue, 08 Dec 2020 03:13:41 -0500
X-MC-Unique: 8-N4CPErPuKbVxQHthVWAA-1
Received: by mail-ed1-f71.google.com with SMTP id u17so2310645edi.18
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 00:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQ3YYnYCSeNJFntjBuzvC1itaJ45prWp1eyYiNm6Xic=;
 b=jAYIHTDpmiYLzb+OKXd3uoGvlQbJqZ7yX+b6duxN/I/UuXGGDFaw6rDwujKDNrwxO6
 6KStHvWxxFx7JrqsKnWbyPA64tiLdbgz382+txDdRhGLPhiTUGS2iihzdw1MXnZbSWTX
 O0DLNtgA7TmGzLKixyCPudn4+MRkJPe6fCyY6SyicF80i2hHDUrmzhiKDyKn1cnsAoOs
 iXFM6CKraqI0SMkLocyFVx+oPzaQCBRy+HIpY3GJGius02OayD62n8FsGw+Kto7suXAv
 AZV3c/o0bdU0/1SVXFHCjM+ewYHv8WmGHThPpuOkcPJyhq3SJ4pta7yGpCTHLj4lVYWv
 EwkQ==
X-Gm-Message-State: AOAM531JYkWzHoo83UB6GarkjOQKVhjxJ+Saw8KaFL4QQ3javVkxp5bj
 e1ETZBatam5PCuQCfH0IDjqVAzjTKd3GnrkCkBS9mUwPhwgEBXlHoTdwZBptGCVwLEoFbQkgcJm
 6fbAARCxdO81yrDI=
X-Received: by 2002:a17:906:1294:: with SMTP id
 k20mr21867817ejb.404.1607415220699; 
 Tue, 08 Dec 2020 00:13:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj/ijd45z1O15en0IKvIzLqx+1oQ/8mZpEgv4IAKZYBYptv2/cHsRJqyPoHdN3ifLA9jaVTg==
X-Received: by 2002:a17:906:1294:: with SMTP id
 k20mr21867807ejb.404.1607415220485; 
 Tue, 08 Dec 2020 00:13:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id e10sm15272841ejl.70.2020.12.08.00.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 00:13:39 -0800 (PST)
Subject: Re: [PATCH 10/15] vl: make qemu_get_machine_opts static
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-11-pbonzini@redhat.com>
 <d0ee4dd3-36c3-adae-13f7-2ea436a9a042@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <61c99f88-c160-0539-4ff2-a2815cf17bd7@redhat.com>
Date: Tue, 8 Dec 2020 09:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d0ee4dd3-36c3-adae-13f7-2ea436a9a042@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: imammedo@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/20 03:16, Daniel Henrique Barboza wrote:
> 2) find a way to make object_property_get_str() to return kvm_type =
>  NULL if the 'kvm_type' option is absent  and keep spapr code
> untouched. I don't have the knowledge to assess how hard this would
> be.
> 
> 3) I can change the pseries logic to add an explicit default value
> for kvm_type=NULL or kvm_type='' (i.e. no user input is given). We're
> already doing that in a sense, but it's not exposed to the user. I
> would call it 'auto' and expose it to the user as default value if no
> kvm_type is explictly set. This would enhance user experience a bit
> and avoid having to deal with a scenario where kvm_type=(blank) is a
> valid input.
> 
> 
> David, if you think (3) is tolerable let me know and I can send a
> patch. IMO this change adds a bit of value regardless of Paolo's
> change.

Yes, I agree that (3) is a good idea.  If you send a patch I can 
integrate it in the series.

Paolo


