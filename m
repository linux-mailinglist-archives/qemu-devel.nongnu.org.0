Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D44E2338
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:21:46 +0100 (CET)
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEET-0003bO-Iq
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:21:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWECE-0001x8-3x
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWECB-0006cJ-FA
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647854362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzMcRAzhtax/TBWdZoDdOySK9fTKtZVW/PzbvE377SY=;
 b=D3AXkWfQmh/OeuM8k5tXhhWmdJGdBZSs6gCaqf0qfmUUKT9hv7KLeGg/WKbREo7puxSZe7
 4n9T6tBHI6mX1l9FHGP3aRNJtfWhQzhX+0nnPaQGaUcPJ+etf3kWbvRBzacyNFzbx1DNjH
 pRrR+f2zfIRMgu7K59YA0Ew49a16QCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-wVT9eZ6jPwC8qxc9envV5Q-1; Mon, 21 Mar 2022 05:19:21 -0400
X-MC-Unique: wVT9eZ6jPwC8qxc9envV5Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so2879578wrg.20
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tzMcRAzhtax/TBWdZoDdOySK9fTKtZVW/PzbvE377SY=;
 b=bI+ArI1MF+ltQxx6/C3dVohJTGHWw7fzZB5rXa/svrt8nn36fLvuccuGQbvDZtuk2s
 0TCoLrelEO5kCwMHw/rY6GbMJVeoUNAgtBS1bGAvgGU9+5Hx8bsGR8qFFRWDuFAjZnyJ
 7gYATD9oWGPTUSgWbg4q2NxUEWV4z1oNw+EtfNjLl3dNAhEb20KhojbAbHLJqIYPkBQz
 iO53p0V/AvqbQtKuoJmyunAJBGqd/fTEQvnMvnPUMpQTi8SS1XIjAnTgYWdpoMDTI29u
 rD5AakecCyeKiEvKO3u3m6ebLzejgl+hFbuFk2w7m86fm9GH4sDOoLzE0UtjYIVX3TDR
 P/DQ==
X-Gm-Message-State: AOAM531LPGndxdX1E+GjEirKLlJIqWfvDCRxdYcRA/y7HluTdpdEXYYz
 ki2iglwwyhbpe72Inqn4m8zSLJd6k5ReZRHGm/77qZD01pak+nxIIWeBsPB4+/RRB868LgbYgLe
 OWp8/tQJsKvY7NBI=
X-Received: by 2002:a05:600c:510f:b0:38c:9d85:9145 with SMTP id
 o15-20020a05600c510f00b0038c9d859145mr6301180wms.32.1647854360213; 
 Mon, 21 Mar 2022 02:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Hdaf0URwQKnZX/odkc2PjznbdJ33E6Qo0HfsnJ6RlR08jAUKtLfPiZN/ttLt+lGzVT2GLw==
X-Received: by 2002:a05:600c:510f:b0:38c:9d85:9145 with SMTP id
 o15-20020a05600c510f00b0038c9d859145mr6301160wms.32.1647854359944; 
 Mon, 21 Mar 2022 02:19:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm12928194wre.22.2022.03.21.02.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:19:19 -0700 (PDT)
Message-ID: <08527b58-8ff7-e846-a405-f68faa7ab42f@redhat.com>
Date: Mon, 21 Mar 2022 10:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 00/11] s390x/tcg: Implement Vector-Enhancements
 Facility 2
To: David Miller <dmiller423@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <CAEgyohXWk7uFrZmOwZKSYtrHs8_NnAWhvr9DgqnYP0JmLEPP_Q@mail.gmail.com>
 <CAEgyohX__f2CmMTpJQ=y7T2GT3B9Pa7k9VggxsPaMdTNdkDK=w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAEgyohX__f2CmMTpJQ=y7T2GT3B9Pa7k9VggxsPaMdTNdkDK=w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.03.22 02:14, David Miller wrote:
> Is this waiting on me for anything?
> I wanted to ensure this is wrapped up before starting a new project.

This fell through the cracks because I wasn't cc-ed by Richard on this
series. I'll try reviewing this week.


-- 
Thanks,

David / dhildenb


