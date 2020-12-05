Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D372CFC15
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:39:22 +0100 (CET)
Received: from localhost ([::1]:59994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klaaf-0007H1-Ip
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaYP-0005Wh-Uz
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaYO-00075v-CH
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607186219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5Y3WVwaLmxmJ02hdcNvrAVZLa5hbYQUi479HkVtV+A=;
 b=izaDodPJCmyGsOHUwDlOrbfwbCXS2mpM1lZabWVW5Av4zcXP/toPrTL4PKCevz/OkkLguP
 Bk49uRSJrZXWqvg7j7AuHYNNhFl9OrcOd7chqsvmLNGWmCzTu6fyRtqGuE0uJX+5doj3IE
 JEmCkorVOamuITS19fbIM+rIscj6p6g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-BffuLZqgN523onoXDNug1A-1; Sat, 05 Dec 2020 11:36:58 -0500
X-MC-Unique: BffuLZqgN523onoXDNug1A-1
Received: by mail-ed1-f71.google.com with SMTP id a9so3046501edy.8
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 08:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U5Y3WVwaLmxmJ02hdcNvrAVZLa5hbYQUi479HkVtV+A=;
 b=YLnbMy/4FOxCqL/CbjmqPWn0IOkyuhHj9hqV5AlQ7fH2L6gH98J3Ql0yFtGWsGjnUy
 oNpaAS13YM/V8kTLtbm7Q/xwgjlTKe6o3+FIirbZJiXpAaE85bRQF1dSgqASKXfJ08+4
 AgPse1j0lja6BSgND9y0pMaQwCjmmh4Y08+SDQWjpfa+s4ytcP8QY/4u2Q+Wf4aVq0eY
 6xhWTVa+Jzqq8zOmRwVAP9uFgl7jAKKw0vh4mcL/eCWYWTNygwPpr6YSQdEEeYzmbUN5
 7dOYuk30w1NyzSlIjtiSwC5XqhIpwxRv1lqubBZ6TjQtl0NMRUtzMiBwE2ou51MCdD+C
 bTNg==
X-Gm-Message-State: AOAM533Y+5qbSFKzmThagAl5E5e0mQY1WscZ7YBeQcUQikgr7qL7tH62
 tNlIvzATV1M8XL7HVslKbBwqBupttGm9bbLcEJf+eU+whi2UvPVidCFLPldiP1EBTxmylrtMcDU
 uK4R8QVhAsC4KQAw=
X-Received: by 2002:a17:906:2806:: with SMTP id
 r6mr11279537ejc.130.1607186217134; 
 Sat, 05 Dec 2020 08:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz31KSsy4kJ9bEyRi53QvrPt4fWkYWnNZrGcSibrD4RnAhwadlX15dbGBV/j9usRndImP+XEw==
X-Received: by 2002:a17:906:2806:: with SMTP id
 r6mr11279518ejc.130.1607186216913; 
 Sat, 05 Dec 2020 08:36:56 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id oz19sm5887259ejb.28.2020.12.05.08.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 08:36:56 -0800 (PST)
Subject: Re: [RFC v8 13/27] tcg: Make CPUClass.debug_excp_handler optional
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201205161518.14365-1-cfontana@suse.de>
 <20201205161518.14365-14-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <81379817-858e-492d-6f6f-4feada462159@redhat.com>
Date: Sat, 5 Dec 2020 17:36:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201205161518.14365-14-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

On 12/5/20 5:15 PM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/tcg/cpu-exec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


