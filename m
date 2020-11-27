Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F32C6000
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 07:22:31 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiX9J-0007lr-Oy
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 01:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiX8Y-0007I0-DX
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 01:21:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiX8V-0003QC-Ou
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 01:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606458097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkSOoJ9fXyg+isoKF+th1sex0UQVZpWAgmFgx0jfcEA=;
 b=M3VOAwE2fE6WHtJiVOcHtIaRbWnroAAbERCQKEMmDGmHnmsebxFcHoF+0zvmhjV4zSoXAq
 825vTp2PFYgvgD33jbUodDV1YCxax+PDql0gF27FHh0iVaEKmVE/5tMYtxBNJ1dGv40a2A
 EC88z3xhTaxbo7RREQbTWdLjzgVsC/Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-smApknOAP628AbXWbEp-XQ-1; Fri, 27 Nov 2020 01:21:34 -0500
X-MC-Unique: smApknOAP628AbXWbEp-XQ-1
Received: by mail-ej1-f69.google.com with SMTP id a14so1640823ejr.23
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 22:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pkSOoJ9fXyg+isoKF+th1sex0UQVZpWAgmFgx0jfcEA=;
 b=daSnMJyLQxxmJ9fsEYtSvzT1suWklk5yLC5We138MuqV+RYwsE5q/3Vr9e6nrWdvZ2
 nbNhXqX8EMlIgaQSuozWjG2suuWZJu7gdTcuPlkjFU8nWYRL0qH3bpkqvUkz0sa94Sfg
 EeV7UtJmFd9YrlLjDdNYMhLYzanqer04JN+LPJhGwWnw0mvT8t9fqpc5+dZX9P+sYhAr
 H4YuDcHIs57GN3ENVgjUrgFM+f4WqtOef93oNbpPLQXomEQoKwF29Ol94ejy7e+COquk
 NidA5OEEru8/onCR3uS+cSI9QMUuyr1cDUcst8JBdeUiuEHX4Txrjid3Hw/ea6EIwMKj
 e7TA==
X-Gm-Message-State: AOAM531riNe0r/kJwbh/RsDiEWTfntkBl+3ytZ+FAXz6rzpo6TcFaiKm
 p8h9CtBHeVtEI0JwoAFxfPK7EMcLKmiiU3RyPcgIYkvc8MlIXs58pKOy/nh98tEgWx1SCs6Enhc
 qq0tjPhLuV44tsjo=
X-Received: by 2002:a17:906:e96:: with SMTP id
 p22mr6125078ejf.451.1606458093353; 
 Thu, 26 Nov 2020 22:21:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7OIUlBPlpQLiYkamL0XY3h3tE90IYQLyYLMRY4aYTm3ohEeDUQYf7W8arYOEm8ZGAhMxmZQ==
X-Received: by 2002:a17:906:e96:: with SMTP id
 p22mr6125045ejf.451.1606458093186; 
 Thu, 26 Nov 2020 22:21:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n22sm4441963edo.43.2020.11.26.22.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 22:21:32 -0800 (PST)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
To: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6cbd508c-b24b-3219-3302-196dfefaa8f7@redhat.com>
Date: Fri, 27 Nov 2020 07:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126223218.31480-11-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 23:32, Claudio Fontana wrote:
> +    if (acc) {
> +        object_class_foreach(accel_init_cpu_int_aux, cpu_type, false, acc);
> +    }

Any reason to do it for cpu_type only, rather than for all subclasses of 
CPU_RESOLVING_TYPE?  This would remove the cpu_type argument to 
accel_init_cpu_interfaces and accel_init_interfaces.

Otherwise I haven't done a careful review yet but it looks very nice, 
thanks!

Paolo


