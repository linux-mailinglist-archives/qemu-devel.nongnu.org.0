Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E434E9E1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:08:35 +0200 (CEST)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRF2n-0000GN-QB
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRF1b-00085t-P4
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRF1X-0003mT-6e
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617113234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3SlnLGogtzJJz2dJCioCsfRN5RKBJThqXMxbOPfPtM=;
 b=U52PAAQlON9a3hcpOOOx/wdVDx3o5Y+8XHrVQqHwTFXausMqnbAP+mEQvGmo+Ng4w6JWIJ
 x0ZY0yKpLfvKDnNKaF1tXWMRqFQ6W5O/b+AFt8eeIMUa+wKlQF7h/inlNqsPfBZIKBRKpU
 F+ZWMGL5U4nYg5fL9Bd4ALf73bZIeao=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-WhWmm_lmOnykxu1fqQzdWQ-1; Tue, 30 Mar 2021 10:07:10 -0400
X-MC-Unique: WhWmm_lmOnykxu1fqQzdWQ-1
Received: by mail-wr1-f69.google.com with SMTP id i5so10452350wrp.8
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 07:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i3SlnLGogtzJJz2dJCioCsfRN5RKBJThqXMxbOPfPtM=;
 b=oJC3GeO8k7d1H8+odPfEESobunGD+ZUdu928+X2eyV9RC730SX7zHaY1Lv86FyF8p7
 H373gUmJOR9fhGzmA8SEWISpooMosSdYYDqjgJ5z8IDd51uiGgtEaCYi7AxlIC316m6w
 9f4numdCVO1uvec1UPt74IOeylL+YxXhprgcg1rk1KZBVRSpgojz5aXAQZHXHctCdmML
 zyOcZnWQcV9lwcZL8Qj8dfzouh1frvO31JsGwNIKmNJoPdRqINY2pW2jXETsvvtFcIEu
 tVaYsSRsc2AdmH9JPKwlJnilbE5R+Iex0jH6X7OdHooz4cD/eXvNzLIFHmHQBqOkrqJU
 HvyQ==
X-Gm-Message-State: AOAM531VrlVLafbJo6g8OIApRAE847Fesp7dAlm6+120vErGwW9ndxKG
 bvWaYFJC/T6wEkGwWVGMkiQXEzCXKgQNDqGAtruuq9d9TFAsJJ4WhesuJoZP0jKWYy64cm6lk0l
 2fXX87NjpjVJwvuo=
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr34941396wrh.50.1617113228771; 
 Tue, 30 Mar 2021 07:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIFspi1ACBwd+L7Avmfb75q7MuKlAo9H2qcjL1IYn6d2TLNmP6iKNVwklNVhZIdPIgU87TNQ==
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr34941377wrh.50.1617113228588; 
 Tue, 30 Mar 2021 07:07:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h10sm36159450wrp.22.2021.03.30.07.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 07:07:07 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210330090806.2802667-1-thuth@redhat.com>
 <c8cc80d5-51f8-9c35-ad98-1eac0d164be6@redhat.com>
 <YGMhUTUXJBM3BcW5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] docs: Add a QEMU Code of Conduct and Conflict
 Resolution Policy document
Message-ID: <c9ae35d4-65c3-980a-aaf3-e4be58b68d24@redhat.com>
Date: Tue, 30 Mar 2021 16:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGMhUTUXJBM3BcW5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 15:02, Daniel P. Berrangé wrote:
> Consider someone is kicked out from another project for violation
> of that project's CoC, that would also be considered a violation
> under QEMU's CoC. This qualifier is explicitly stating that the CoC
> violation in the other project has no bearing on whether that
> person can now start participating in QEMU. I think that's a bad
> mixed message we're sending there. It is especially poor if the
> victim from the other project is also a QEMU contributor.

My wording is actually already broader than what is in the contributor 
covenant:

   This Code of Conduct applies within all project spaces, and it also
   applies when an individual is representing the project or its
   community in public spaces. Examples of representing a project or
   community include using an official project e-mail address, posting
   via an official social media account, or acting as an appointed
   representative at an online or offline event.

That is, the Code of Conduct would not apply to someone saying "the QEMU 
SCSI maintainer rejected my patches, he is an idiot" on Twitter.  My 
proposal sought to find a middle ground, where that person could be 
reasonably considered to be "acting as a member of the project or its 
community".

> The wording Thomas' draft has
>
>   In addition, violations of this code outside these spaces may
>   affect a person's ability to participate within them.
> 
> doesn't require QEMU to take action. It just set a statement
> of intent that gives QEMU the freedom to evaluate whether it is
> reasonable to take action to protect its contributors, should a
> contributor wish to raise an issue that occurred outside QEMU.

There have been in the past cases of external people asking projects to 
ban contributors because of views they held on social media.  The 
Contributor Covenant initially included no limit to the application of 
the CoC and only added a limitation after the author herself was 
involved in such an episode[1][2].

I would prefer to avoid putting QEMU in that situation, and limit the 
applicability code of conduct as much as possible to conflicts within 
the community.

The Mozilla participation guidelines (2165 words :)) acknowledge that 
"it is possible for actions taken outside of Mozilla's online or in 
person spaces to have a deep impact on community health" but also admit 
that "this is an active topic in the diversity and inclusion realm"[3].

The Django code of conduct seems to be in the minority in having such a 
broad applicability, while the wording in the Contributor Covenant seems 
to be more informed by actual experience.

Paolo

[1] https://github.com/opal/opal/issues/941 (June 18, 2015)
[2] 
https://github.com/ContributorCovenant/contributor_covenant/commit/c400f17438 
(June 19, 2015)
[3] https://www.mozilla.org/en-US/about/governance/policies/participation/


