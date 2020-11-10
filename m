Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B4B2AD3FF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:43:45 +0100 (CET)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcR7o-0006pO-SX
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcR64-0006CH-Ud
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:41:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcR63-0002ME-8V
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605004913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFFowUrv5aXwU1leZoERT5KVM32hIjqN3MD2FS1+XYg=;
 b=W2QJuFlDNVhzHNNCEYW3kpAwF81xYAoREjYLI1G9fYGg63a3DC2sU7zg0giyjHgV27MT2/
 RBiJtBjao+zvq0Vi3SfT4JhFT+kPgErWpxGOHAx282a35dtSe7BK6ddfA4CbkVDwyVHeXu
 mS/dysfusNaLvaoznGXundxnTvFmXUY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-w8pHuEJFNOyxTNmuwrnsrg-1; Tue, 10 Nov 2020 05:41:50 -0500
X-MC-Unique: w8pHuEJFNOyxTNmuwrnsrg-1
Received: by mail-ej1-f71.google.com with SMTP id yc22so887745ejb.20
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 02:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yFFowUrv5aXwU1leZoERT5KVM32hIjqN3MD2FS1+XYg=;
 b=X1RdjEn8d3NdlTX1Lu2f/Z1ZnHMZ7A9teZtDvef7D+Hy5Ueg/Agl/MQlD999QbJ3Oq
 qel/Hm4gTorV3vOPrgL1ImBus1mQZsRTO+O3utbqa5tGdbcOaTaKHkroDEy+vTLoRQd2
 NAHx3K92BEwXM4cyh+DohA21rXP/4pANLDnDWgbSOln51KHKi08N5/hGgmN7s4aTNhIp
 GZNq/QSHayCOmW3BdyAaFVlAwqIqNTcX8Dz7byUh+dhQqmp0Nr8YLsaLpEPhLk1iL4Fo
 KetbKxSjX9OjHix3N7kMgmdxWCb9B/eMKIfVw8LUkbMkVq9n8ZEX0e4FzAsvlaWkaZAD
 ECSQ==
X-Gm-Message-State: AOAM533GfR6dpvZhiRJJsES62So9dSYF62KY9+wqm62fi55csJFGvCte
 dAisQUusNrLn2OMaXv3/JJJo5QmaOryS2uPd+sXR5Bsn6FmYAL9p1gSIXV41zpWWTTg/LOj1HDs
 TNIw7hm48aE71xfw=
X-Received: by 2002:a05:6402:88d:: with SMTP id
 e13mr20977568edy.366.1605004908976; 
 Tue, 10 Nov 2020 02:41:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlKq6uESlgnZbPAN3gsC/V5WH1r9Czh4n97CPx1H/hqeHSVhQH7J65QY7kDklcgBDfelhesQ==
X-Received: by 2002:a05:6402:88d:: with SMTP id
 e13mr20977526edy.366.1605004908758; 
 Tue, 10 Nov 2020 02:41:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id fx1sm10227645ejb.12.2020.11.10.02.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 02:41:48 -0800 (PST)
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
 <20201109180302.GB814975@redhat.com>
 <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
 <20201110100438.GF866671@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c4c56c06-7530-5705-9ce8-5eff8cf1a0d3@redhat.com>
Date: Tue, 10 Nov 2020 11:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110100438.GF866671@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Wenchao Wang <wenchao.wang@intel.com>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Bruce Rogers <brogers@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 11:04, Daniel P. Berrangé wrote:
> 
> ie, we should have one class hierarchy for CPU model definitions, and
> one class hierarchy  for accelerator CPU implementations.
> 
> So at runtime we then get two object instances - a CPU implementation
> and a CPU definition. The CPU implementation object should have a
> property which is a link to the desired CPU definition.

It doesn't even have to be two object instances.  The implementation can 
be nothing more than a set of function pointers.

Paolo


