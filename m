Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B04190A4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 10:18:22 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUlq9-0007Ay-4T
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 04:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUloV-00063a-VN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUloU-0008B1-Fv
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632730597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tr0DAlC6FMQlyKVHcGRHxp354PrQkWvzOnCBD9pEj78=;
 b=OziacHET3lxJ/pDPmfmSDLPhd46TwA07nxVUi44yn9fZlfNMJJj2ea5Mf65+MUCHWQGVly
 /tdEr1tn1A07uEFEeZmNeEqRnXMP1iKizOmriiSyW0fgaoOf4rYteXRULCJIuwElcJUFAj
 k3feB+GbCebrs9YnJ07JZzpCdt4eCfw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-wZfyb0w5PjyurC_ab3A5aw-1; Mon, 27 Sep 2021 04:16:36 -0400
X-MC-Unique: wZfyb0w5PjyurC_ab3A5aw-1
Received: by mail-ed1-f71.google.com with SMTP id
 a6-20020a50c306000000b003da30a380e1so12103643edb.23
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 01:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tr0DAlC6FMQlyKVHcGRHxp354PrQkWvzOnCBD9pEj78=;
 b=oXk03guym5yWPh6xhXYT480AdiqTm/CIlGaTtX764Nlu6RGXOMG8pYemi/JjtRvqI/
 WLM6b153nURUatHPuEAxjm/cZKezRz5iaMNwaGD5QGowBvLJu0pgny+9Hxqfjb5TvG1v
 BFF/p8L9HH5kD61Kn9Bl4Ubjwx21iWw4uSnEVfK5x5UqKsL9xPReC+qzr8DpFEvVw1B+
 o9F+q2Gzsgidzvly9uxZlYiFdtHhol7U3E8XQHgyRM20MmSIjees5MZkChpQcO+cltJq
 cTGiRpIkHAF34l3pBhlf39MmFKQ9dp8Vysw5FMs8LBgVV1n6fQfcTyoY2OeAqmk3i5Pv
 SR8Q==
X-Gm-Message-State: AOAM532YyChvQOwOiDVVDL+w211gbih9hRWWoeqIGFmb0JbOnugpYw4g
 etSuxVzoHsDKUPhWqvjd7TDx9MXVUhnn1/szAtETmcfpdJE2wyDOKJVCBXrFtMcySZMDwSrEgWd
 JMqsQ0hNbIH1XF+E=
X-Received: by 2002:a50:d98d:: with SMTP id w13mr21884992edj.51.1632730595400; 
 Mon, 27 Sep 2021 01:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL9orlPEn3XpJVCIFG2J7cjO3CF+1+w7tbFot5s+Z/ZIGXBUfc1+INZOJFsa9cOQLpCPQn4w==
X-Received: by 2002:a50:d98d:: with SMTP id w13mr21884970edj.51.1632730595192; 
 Mon, 27 Sep 2021 01:16:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id q6sm8105616ejm.106.2021.09.27.01.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 01:16:34 -0700 (PDT)
Message-ID: <e2d47803-87ab-f48b-0947-70d99f3996be@redhat.com>
Date: Mon, 27 Sep 2021 10:15:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210924090427.9218-12-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/09/21 11:04, Kevin Wolf wrote:
> We want to switch both from QemuOpts to the keyval parser in the future,
> which results in some incompatibilities, mainly around list handling.
> Mark the non-JSON version of both as unstable syntax so that management
> tools switch to JSON and we can later make the change without breaking
> things.

Maybe we need a different section for unstable syntaxes, rather than 
overloading deprecated.rst?

Paolo


