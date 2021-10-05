Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885C4230A7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:18:25 +0200 (CEST)
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpxH-0008GI-Mp
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXpvV-0007E5-C9
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXpvR-0005KB-Ak
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633461387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSX000wYKTrORxaxvWHBWfzhvR60Rd21ZXYdn21m63A=;
 b=DArmNil8p0j71oFdZa2F9pBw9yXgkNNNh2I/uIkkSsK8y54xGm8hv3LoGuCrFYe5w6W7zf
 lq3FQA00kPVDQYLX+hT8vZa2Tea0yNkRniKIKGD+m0+61CqGc8ltVi7+fiu7/AydHc5JpI
 pjM10SrLvGdUex1qvyAPquKkXx+o6Xc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-icbuJBPBOq23LKXake4yNA-1; Tue, 05 Oct 2021 15:16:22 -0400
X-MC-Unique: icbuJBPBOq23LKXake4yNA-1
Received: by mail-ed1-f72.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso242412edx.2
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 12:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=THl8aVPS6F1uabbI6Sv1L2nIDyNjKGvJ0IwK6/NADE0=;
 b=ULNc4xkJLLRXFLOyaM8W29eqKgfOu90fIlGXgddADyt0klt52fezpYeyV1aXaJPC20
 hUBdz5AWak/UqhAn6xZRfZ5Gx2iCS4VKpHMESdkrU2fop1D54ciXevR3U4YWuwFjP7ix
 n93zpOLH+qFXC4H3RSFDBfIyfEJJxh/HdKHa7O5AQvPzj58U/5qvGqfGgA7OmWZC+LhV
 6Pe9/Xz4+BsBiWL8AyFhX5Id2ykEIEYmHQemEiCXBqbeEOpoE3WL9WTi1WfALNqZihmX
 Fm/CfKup9SeIsT2Pqj6QaNDa/9vybcBOvhHeW8TqyHCsHfMJc06NXmo1eSiji1gWnOLW
 BlMw==
X-Gm-Message-State: AOAM53333yAcqA2pYuIDFzGxLZSC/20lfX8a8iTqaKRNtBz0tbnXPsyj
 iHrfaI/R+9OknEIJFfGYuQwDg1nBC26oIBqxU3fu8ajAEh5tMMRPFcsMB9g3PXosCVON8m5y3mg
 ewH3SLD2GCvfweUE=
X-Received: by 2002:a50:e006:: with SMTP id e6mr27655756edl.302.1633461380885; 
 Tue, 05 Oct 2021 12:16:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznJNZ9FNHvj/wl0tQMYHz9WOykI1XhpZrbuwQa1FUQHWRQ/sOr0IWO9TTAFmm2WEvmvKQl+A==
X-Received: by 2002:a50:e006:: with SMTP id e6mr27655711edl.302.1633461380538; 
 Tue, 05 Oct 2021 12:16:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n1sm1501250edr.64.2021.10.05.12.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:16:19 -0700 (PDT)
Message-ID: <e1340bf2-90f8-27a2-21bd-c537904f7740@redhat.com>
Date: Tue, 5 Oct 2021 21:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <e43cf822-c23d-1ddf-398e-71f78ea05b43@linaro.org>
 <4dcb518e-dd69-ed75-1d57-7fcf76c5cb69@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4dcb518e-dd69-ed75-1d57-7fcf76c5cb69@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/21 07:24, Philippe Mathieu-Daudé wrote:
>> Why here and not in the parent meson.build?
> This is what Paolo recommended me to do last time I added a
> conditional inclusion.
> 
> Personally I prefer having it in the call site rather than
> the callee (no need to read the callee to notice it isn't
> called). I guess this is for readability, to not clutter
> meson.build? files more...

Yes, pretty much.  In this case it's quite obvious that bsd-user is 
BSD-only, but I prefer it if dir/meson.build has the knowledge of what 
goes on in dir/.

That said, we're not terribly consistent, see have_block and have_tools, 
so either will be okay.

Paolo

> Paolo, what is your preference?
> 


