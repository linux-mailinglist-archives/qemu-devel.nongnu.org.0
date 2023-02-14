Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A47696019
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:00:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRs6z-0003Gi-Ht; Tue, 14 Feb 2023 05:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRs6v-0003Cn-PN
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:00:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRs6t-00042E-Rw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:00:29 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so11143902wms.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p0NhzeHalnbHe7U254EQfBD3SwspbsypGY324wZaHQk=;
 b=hDmPNy+UNo/UYh+u//wvZKAVlYhTMUHZOZFUofS6AC1GsVatlaFqMTYcqspXLB0PLp
 nrxC6teJ1ezrktnkQhIu+KAL32GA6hrx3CTaQisoau7oBG9S4YSVKpRHtkQ142IRRizI
 3IH8F5z/ak4mxe4ERo0y8poCd8ClMJxmAAm1xhsITVxeA1zN8sKy1ZkM7HF7LNxyy8ni
 0qZxJTDao+r5cMgkPdOMywPRIC1I8aAgs8eofo+C0x9EHZLsa6UPlGd3DykdiMYTaEHS
 qH6mfaUQjnnwtHYXeJ2nMBAGihzFkCRkfyHhqxrBaYzNtpYpF6ll/L/Tbd7uwb5DE/um
 rdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0NhzeHalnbHe7U254EQfBD3SwspbsypGY324wZaHQk=;
 b=JZFFfYpd7VgLxM7ZuVOWh9m+6TAAy09QWcENt4EEH6AoBHiEpGdaDZwLE9eDWE/W5D
 gM4StzUvEuOKwFSvl/cLb2OhWx5mn2quXuIOiO0Xlx/QveljYxgm+RzMz8Zi8qT7xbZR
 tVq1qh1aFnvzq2mfVlVwiRa/R4W2tdzLusi2zzYizm6FL4DMbJBMk97v1dGp8HFQmIVB
 Rpk0U2uX6hCPSbIje4SRnDLXq/QKPx1OndR3WtYgsFUjkJhs7yX8rgWW7h0xjfdexwWZ
 TohXqJKxALXJUSZLBhso5Sh1Lv42L5HA7J7Oq7SAEsy2J4QTmPoxqGr3S3JDN3mVCXyP
 nl5g==
X-Gm-Message-State: AO0yUKV6oK4aU5iyo+fGiMVyztsPoPiqk0GXpayN44yVgdMHI+tTyflq
 +FLmuBUkfk0ldYB1dstzW2g=
X-Google-Smtp-Source: AK7set+qwb0tAajp7ipXuz1Q10EQgK01sznKXpVgxIV3yLN1xs7rf4EeWsIBrzIAUHW75DPOMXfbCQ==
X-Received: by 2002:a05:600c:715:b0:3e1:12d1:fde0 with SMTP id
 i21-20020a05600c071500b003e112d1fde0mr1501894wmn.6.1676368825745; 
 Tue, 14 Feb 2023 02:00:25 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 c129-20020a1c3587000000b003dc1a525f22sm17423697wma.25.2023.02.14.02.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 02:00:25 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f6a4d190-01bf-1a4d-c18b-a79a565d6123@xen.org>
Date: Tue, 14 Feb 2023 10:00:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 46/59] hw/xen: Implement GNTTABOP_query_size
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-47-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-47-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c  | 19 +++++++++++++++++++
>   hw/i386/kvm/xen_gnttab.h  |  2 ++
>   target/i386/kvm/xen-emu.c | 16 +++++++++++++++-
>   3 files changed, 36 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


