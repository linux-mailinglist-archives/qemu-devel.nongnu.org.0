Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368CB2C57EF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:17:26 +0100 (CET)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ1R-0002Gj-AI
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIzH-0000y0-81
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:15:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIzF-0006wz-GK
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606403708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tw8xyH7XERYWo9cRSvvsen1ftYY3Rz8G8SbJ+FpQOxs=;
 b=TqrYVuexfvGmPbJ/1Wz5QMM0PIt99TvEXhMgHS5piIDkqAKNe0N7zYLrxmerYYkbbOWBPQ
 7uSORanbSXiAlPcJ8aV1ImxySeyfA0DbmHOKjBcrXpy0b9bLgTPvWwd5CILPDwpLjCcTrC
 sD61dnkDyNx3MoZ7EO01zJKVyANrqXY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-RU6fQk34PV2CM4sDUAAfOA-1; Thu, 26 Nov 2020 10:15:04 -0500
X-MC-Unique: RU6fQk34PV2CM4sDUAAfOA-1
Received: by mail-wr1-f69.google.com with SMTP id q11so1432761wrw.14
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 07:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tw8xyH7XERYWo9cRSvvsen1ftYY3Rz8G8SbJ+FpQOxs=;
 b=jhoH3wQLBZZp4OKLG5jg9voIJhYLBRFUqrFz4DMF4ftJzvdzY7eEwTm523e3JONlM+
 AhX09gbRsYFQGQfKFzC3c5Seqyw4k8BE/FgPTt4ps/LfTA9E3O7Lk26BMEWyxi8CEHCl
 oNSrwu7C2kz2wR7siH0mGHrILkLmVoxsWCVbqu/4iq3ZixvUIn0MuEBjgoiH7dF+xlox
 84cFCKMTFePsR98EtnmGN0OwMqV/jhy/rX7KxT+eo4KOeidoxwPb/oQTsylwq2ayefel
 JCKoChbyTD+5TkDrWWih0ZvdernvO+Vn79I0E/DNCbNOrg6U3lOavN+CZUTMu6cL5mXH
 dxJQ==
X-Gm-Message-State: AOAM533ZvEsHfLWUlYoPuYvCJTUFZgf5rgryI8WJkIxS39ibHfMD0QzB
 B3OwPVnNQ47yuUElepzDxDg7w4ref9xDeKtQWyYCGAEJTcMiJIQZ3JY0Wy8KTTWcLMiwLBeNPjt
 TFe6GDQN7mSFeqlI=
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr4488308wru.80.1606403703386;
 Thu, 26 Nov 2020 07:15:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzroVeerMarfM7JaNasnGIhweGZ3lKnRrxRaY9FDehEkgKdU2FjJfHV7JWRv/rvPu9jefqtew==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr4488272wru.80.1606403703210;
 Thu, 26 Nov 2020 07:15:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c9sm8829970wrp.73.2020.11.26.07.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 07:15:02 -0800 (PST)
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-12-cfontana@suse.de>
 <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
 <20201124213159.GA2271382@habkost.net>
 <1205be9d-d2f0-4533-68aa-608b16ad2181@suse.de>
 <20201126134425.GH2271382@habkost.net>
 <86ba92db-7b01-5644-7452-2fde753ddba6@suse.de>
 <20201126144959.GJ2271382@habkost.net>
 <16445790-3371-9775-3d03-f8c8f0d66b18@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <772a0f85-555a-50ee-2b5e-35ff748a589b@redhat.com>
Date: Thu, 26 Nov 2020 16:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <16445790-3371-9775-3d03-f8c8f0d66b18@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, "Emilio G . Cota" <cota@braap.org>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Dario Faggioli <dfaggioli@suse.com>,
 Olaf Hering <ohering@suse.de>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 15:55, Claudio Fontana wrote:
> If we agree to use "accel-cpu" I would lookup "kvm-accel-cpu"
> if we agree to use "accel-x86_64" aka "accel-" CPU_RESOLVING_TYPE, I would lookup "kvm-accel-" CPU_RESOLVING_TYPE
> 
> * initialize the arch-specific accel CpuClass interfaces */
> static void accel_init_cpu_interfaces(AccelClass *ac, const char *cpu_type)
> {
>      const char *ac_name; /* AccelClass name */
>      char *acc_name;      /* AccelCPUClass name */
>      ObjectClass *acc;    /* AccelCPUClass */
> 
>      ac_name = object_class_get_name(OBJECT_CLASS(ac));
>      g_assert(ac_name != NULL);
> 
>      acc_name = g_strdup_printf("%s-cpu", ac_name);
>      acc = object_class_by_name(acc_name);
>      g_free(acc_name);
> 
>      if (acc) {
>          object_class_foreach(accel_init_cpu_interfaces_aux, cpu_type, false, acc);
>      }
> }

I would use the second; there's no reason to have allow only one CPU 
type, it's just a limitation of QEMU.

Paolo


