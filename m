Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD724E3ACE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:40:01 +0100 (CET)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWa3c-0005d5-M3
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:40:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWZyY-0002TA-Hx
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWZyV-0003jP-Ox
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647938083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNMoGiGEa4FzNHTlGpJO+wZIlts8dLhPLzVuLbGfypQ=;
 b=MYyfDiXcAebTijS1IzF6PirrCM5I4SfMMZ3ldMyX9Uux70R0rDG8ZWzgLXV0b59bVsm87t
 50SYfBcGRYFn3XnCLGtU6bFmm2tWQK0p8I/hfwWXoRBVBE/ECURaw5dT2lODhXiUwjZvPX
 IsaFWXANAJUD4FECwGegQ63z5XXi3cw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-gG1L9KW9OruHIh3DcRJTcg-1; Tue, 22 Mar 2022 04:34:41 -0400
X-MC-Unique: gG1L9KW9OruHIh3DcRJTcg-1
Received: by mail-wm1-f72.google.com with SMTP id
 4-20020a05600c274400b0038c8ab2e835so534092wmw.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fNMoGiGEa4FzNHTlGpJO+wZIlts8dLhPLzVuLbGfypQ=;
 b=UcSk9VgRcOuwdy/HRKbIC00G+ltFA7Zx7f3VvDvKMZg35sAz7ysDfORLPaEw0ODC9x
 nTEI3zQp1ANz0DLOFEq0z5atlkV9Z5A1oAFNuE78LI+hGSDfNn3EAev7AfEvLuzSnhIR
 6NP5oVA4rnA4S8ONW7spBMWGIXUyYzlgLxplbMXTmZaM+sgGhTgCJEmgzfAFZNYfa0bs
 O7PlI3xUdw6qNGPimwVMWFgIf8U4AU5j+o+8d7MUEmatQ37xiYCXH/ZywbC+hShiUqXr
 9tuNCSNtHYlnPEcUhWcnVcGwBxdKFP5JeMbxKb5/k/nNgvoGfcas39RHtWpvfTKa1gL2
 HtjA==
X-Gm-Message-State: AOAM533JsnR9rnNgek1RL2++Sh5Lw38wcorNnM94M0RqlXAtZHMyYDj9
 AMFt0SYCw8b7hghigcK0kL8/z491qE1zd7AcYVWLsVgnkMXmfhhLxRrTdRNxHAG4Tqat2xkWGql
 cMtqHkEmCInFu24M=
X-Received: by 2002:a05:600c:3482:b0:38c:40:9b30 with SMTP id
 a2-20020a05600c348200b0038c00409b30mr2690945wmq.68.1647938080758; 
 Tue, 22 Mar 2022 01:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFwDVmvLzbFWJyFo5TfnMfe52tyaRhvNUKdnoYYEBDQVyh9C/GZKuXIX2OnBo8GdGSSC5Ieg==
X-Received: by 2002:a05:600c:3482:b0:38c:40:9b30 with SMTP id
 a2-20020a05600c348200b0038c00409b30mr2690927wmq.68.1647938080464; 
 Tue, 22 Mar 2022 01:34:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a1c6a01000000b0038c9f6a3634sm1354979wmc.7.2022.03.22.01.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:34:39 -0700 (PDT)
Message-ID: <cfb8c6c3-0112-071a-3fcc-d4fc8e29840c@redhat.com>
Date: Tue, 22 Mar 2022 09:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 04/11] target/s390x: vxeh2: Update for changes to
 vector shifts
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-5-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220322000441.26495-5-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 01:04, David Miller wrote:
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


