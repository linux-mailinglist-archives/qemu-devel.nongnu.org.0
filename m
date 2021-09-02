Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8973FED0E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:36:04 +0200 (CEST)
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLl0l-0005zC-6J
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLkmb-00039B-0B
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLkmY-0001rk-DJ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630581680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pS7Ct75QclyGp12vGb2kywIQhJhg2YP7TpECf9QcdUU=;
 b=L1H06GLrZcnkVsfob19VwP3mLHOQgmYpk4YaE7x22aGb9JWt7s2RbAuR24eXMUp8qSOZu8
 YZdbVhtvRDDeWniPfWLmRooPn7xUmhYUlh0f5UImZZabav9N9vpRjRvbCaNnoc6CRznDhU
 0bE1QACc+WoL+w+HgdMyh9eWq80jO/8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-JsKNlzypNdGv7ybvcwcoaw-1; Thu, 02 Sep 2021 07:21:17 -0400
X-MC-Unique: JsKNlzypNdGv7ybvcwcoaw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so574241wmp.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 04:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=IIcBblVXbdCJPIzpT3z2rlVpbmk/wQxRD/ILJQjJZgw=;
 b=SccM0VzstWgkUYnyEW/67eYDreEKL/UXMln/8ATJrjdpqO+77rd1B0iYEFmKU79sZj
 RKEaTg13hkFmfDuVqn9oSyBLgJBHBXTsOo9uvnWc/gRf1s1TUNmK8S+mC2VnzKJxPMLx
 NWT347/P0uInUj7xxM6B8UDNgoOzQqollMs2RmrURdGOgCZ/d6uVn9Ccut3vzna+n+OR
 ALn6zADu9Op4058GQpMmtktN7Ui1aExd3gbwtXO998VEAWZzX002BGg3DoI3E9oRApq+
 0PLFjsISdKQ/opNocZnrZBk92om+HJuqrTKeTt7oN1UZIpyrWD2bH6UYWG5goZ5M0Nzl
 vKfQ==
X-Gm-Message-State: AOAM533NNbpIxijMJZkaowlx++uegB8GUub4Er+wrqHdrX+CVaS8pF/H
 ZkIeX097vuL9Rg8DYow8qvct8U7kVXoQ9rBTOCAglHPjxwCgz5NyS9feQQjku9fl/gAwl/nAal/
 HOcK6YxX3z7/SmCM=
X-Received: by 2002:a5d:460a:: with SMTP id t10mr3112986wrq.147.1630581675712; 
 Thu, 02 Sep 2021 04:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznONPFJ7sIglMmHSpJr1VYdZb2ShTYbP/4gNoZnYxWnnnKkjPvR9kpq8hNwxeBwrhZRvVQEA==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr3112966wrq.147.1630581675516; 
 Thu, 02 Sep 2021 04:21:15 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 j17sm1512262wrh.67.2021.09.02.04.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 04:21:15 -0700 (PDT)
Subject: Re: [PULL 00/56] Block patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210901151619.689075-1-hreitz@redhat.com>
 <CAFEAcA9r9R0Pn4_XLU_W88NoK75RsWw-EEpxLPMobP0jF1DJ3g@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <a11e545d-5e81-2e49-09ca-dcc1aa2a14c2@redhat.com>
Date: Thu, 2 Sep 2021 13:21:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9r9R0Pn4_XLU_W88NoK75RsWw-EEpxLPMobP0jF1DJ3g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------4476A1921250A65FFAC6BC08"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.225,
 NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------4476A1921250A65FFAC6BC08
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.09.21 13:07, Peter Maydell wrote:
> On Wed, 1 Sept 2021 at 16:16, Hanna Reitz <hreitz@redhat.com> wrote:
>> The following changes since commit ec397e90d21269037280633b6058d1f280e27667:
>>
>>    Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210901-2' into staging (2021-09-01 08:33:02 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/XanClic/qemu.git tags/pull-block-2021-09-01
>>
>> for you to fetch changes up to ebd979c74e2b8a7275090475df36dde4ab858320:
>>
>>    block/file-win32: add reopen handlers (2021-09-01 14:38:08 +0200)
>>
>>
>> **Note:** I’ve signed the pull request tag with my new GPG key, which I
>> have uploaded here:
>>
>>    https://xanclic.moe/A1FA40D098019CDF
> Hi. Unfortunately my employer's internet setup blocks access to
> that site :-(

That’s too bad. :(

(Perhaps it works by IP? http://159.69.123.47:8080/A1FA40D098019CDF)

But I think it’s small enough that I can just attach it to this mail 
(which I’ve done).

>> (I’ve also tried uploading this key to several keyservers, but it
>> appears to me that keyservers are kind of a thing of the past now,
>> especially when it comes to uploading keys with signatures on them...)
> IME keyserver.ubuntu.com is still functional.

Yes, I’ve uploaded it there, too:

https://keyserver.ubuntu.com/pks/lookup?search=hreitz%40redhat.com&fingerprint=on&op=index

And it looks like that indeed it has capture my signature.

Hanna

--------------4476A1921250A65FFAC6BC08
Content-Type: text/plain; charset=UTF-8;
 name="A1FA40D098019CDF"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="A1FA40D098019CDF"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUlOQkdFU1Voa0JFQUM1Mmt3
bExkTDhoeHBWTDRSdlBjZXZRS2N6S2FQZm91S1ZCMmFxa0JXMVd1Ri84YXF2Cmx3R0dubFpsaDNQ
ZWlkSUMwQ01BM3FyR3Jhem1xYkhIeFVvc2lreXdEekIrQnJldDIvUmRYdVg1OE5FS0NsQlIKN2RH
Z3UxczBMYjdyWVpFanhKWWxhWHhLZzdKeGNxMnVvdzIxc2JPaGxkT1RkUzY0YWZNN01NYmFIaUhl
NTQ0eApuREpwNlhCcXpCKzRUbTB2WCtjUFU4TG5jem13Wm1CMGZSWnJZQ0JZdHNZN3hLUWdsTFl6
N3Y2d2VuUDhiNEJFCkovQ2tjdGcyQS9NaFF2MVBQb1hLSm9aczBPQVNNeHk3bmFPNHBUNmNDT0FE
elp4VVlWbEZGR3EvVHpyVjdkaUUKUk5TQ3lmQ21QM3RTV0Q0UDNmUmNGaUZYZEo1djRLWFRFOVl0
QmZheXg1aW9hcFY2STY0aUJLU1FNLzZjemdKSQpkT1dmTHBZb3NMT08vc1dIdGtCQm5MSi90bzFO
dFRPcUpJa2VTNSt4d0d0QW5EdFovOXVVdThYcGZTbUlwc3luCjRIYU5DWjREWnhjZHlyc2xxWnNF
V0xBdjgzNDR2bTh3RUpscE1yb3lTSTV0NHRjM1Y3UWZsQ2xScE9YVkRkaWIKVi9neFEzRHBTaTZX
Z3FWUDRiTk1HanlYWUVxYmVLNkFHd0drR09veXZtNjVnQytybDhBTmxSWXRYZEFYQW0xcQpRZHkr
VEVvNlNwN1dPWW8yWmQwYkZEKzBqV1ZFR2JVM0s1OWJrVUxCV2VvclF0UmpFUDl1ejBWanhuM01v
cVJDCjFVNldzZkw4VzRMRFBOUHJ3Zk04eCtIQmh4azRHOThSZHlKZUZacTNqNVE1RUxzVWpHdExF
aCtxU3dBUkFRQUIKdEI5SVlXNXVZU0JTWldsMGVpQThhSEpsYVhSNlFISmxaR2hoZEM1amIyMCtp
UUpVQkJNQkNBQStGaUVFeTJMWApvTzQ0S2VSZkFFMDBvZnBBMEpnQm5OOEZBbUVTVWhrQ0d3TUZD
UkxNQXdBRkN3a0lCd0lHRlFvSkNBc0NCQllDCkF3RUNIZ0VDRjRBQUNna1FvZnBBMEpnQm5OK1pE
US85R2xNYnppTGpxV01jcGt1SUxoRUk2SmU4a3Y5VFZNc3IKMTM0ZlRkWFFhcXZlSmViVUY2Smd1
cnBlWmJtOWZEcG5Da2s0QUE1OW5mUjdHTS9BT1VrMEo0M3hoaXFnblNkSApSMnpMYUR3dndUNUNp
QlVBeDJkMkFBbGVtTHc3Z0hpTFBkcWcydGcrWWNIL0xMRHA4Z3FFUTdWbVRYUWgwbFo3ClJlLzBr
dmk0dy9XcEtzZEdzWi9PQ2FiQ2I1N0puOEpJOStDSzcyUWptQ0NWT2pHbU04Uk1SU01VNXBsSFg2
SjAKYXdrNUFMdWF6TXVJQi9ReENYOGNkWXp5Qlhoa2pRall0Tjl4djVRN1NDU3Nob3RXSmtRZWt1
aFN4Sm96elJtQwpjajIyajZVaXZpeVdaMlM0QkxNa0c0LzdueTdTeVcza1A3bnp6Qm5SMk85OE8y
WGo2dEpkd0gxVW1BOWMyM0UzCmlzZVdRRi9ZYmxIVmhLMWUyZmpaNTVjQTExYzVBSng3eTRLWUUr
bEQzeVpKTFJ2alZka01lMURIV0dnM3VzRlkKbm5oeHVFQlN5SDhGakoxSDNZQ096ZEJlWDJpamhn
b2xFeWpMY1I2SU81N2YwQlRnS0FETmpZeVhNNlZWMmVqSwpDVUhiekFCYUdTZjk5ZWNHNjFlZkZl
NnhQVENNQWNwTmpTWVBTNGkzcEord2ZUd2dkSi9pOFJSSGVrODFoUlRXCmQ4emovcmJiWDM0cWxT
YjNzeXV6TFN2SXowYklNVkVtTlVLV3NrNTFDbCtlYTdPcFZ1WFFPbDBSYVd3YXIvR00KNkw5UndU
S0I3cHVkRGlYVkp2RURZTTNSbDZBRVhwUHhaV1U1eUNwK3BkdEpLUVc2bWxKTUxoWm5nYSsxUGw2
NQo4bTE2ZjU2ak1RdUpBVE1FRXdFSUFCMFdJUVNSdnJZS01OcytpRmZSR0NuMEI5c0FZZFhQUUFV
Q1lSSmhHd0FLCkNSRDBCOXNBWWRYUFFPNFNCLzl3TVhYTmtseVd0dGNySHRkWTNXWElYUVRibnpz
dXF0M0YyTWNKZExEZWFxODEKbmIzYktSTkhyNjdHOWh0bUVZYUJOQXdSSXhYM0ZRcks5SU5EWTJ4
WWl4dVFib01HQTRESVRvYTg3Njk4cmdKSApLK09HS3BsblhxdjNRUFVjRDBIQ0Y0SHRMK3ErY2ph
Wi9BTGJUdTVDNEQ5Z29odk9RWTdiYVRNbTVaOC96Rmx0Ck13cmRiZWhNM0tpNmxyRUpRT0RudGdO
cVN4SGJKdWhTN3QwYnd1OWRFSzFBV0cvSlJQbFY4M1NBTllnajNQa3gKRGxQbVg2a3h5L0pyZkdo
TVNJVEg2eHVZRnVmTEhWSVRMaXpTcXFaZzhjdDEwWWM3LzAwdFBZRDhrc1oxVEFwcQpTcGQzbUVh
VjFwdUJNQWVLLzZWSEhnanM3RHBqK2poZ0RkMlRYWE9ndVFJTkJHRVNVaGtCRUFEL1U5SUs1NUF5
CkRUcEx4a1ZqN1ovQUVhOUtWQkVhSjkxbU9HaFpjVXptUjVscHExWEtxdkJrcVFlYjhCWldndXN6
OTNoNTdGcEIKdEJET2FyOHpOVXpGdUxPY2JiQ3FhRFJQL3duR25EODRuUXV2VituelYwdStvMXBq
L0t0N0pvdDJuQWptOWtBZApteHlCQjh0NEI5SlE3a3ZRR21MNU1hTEVEREUxcFR3TURBeVU4STJX
RXhaNGx0RXZ5QmNjckRFZGlSSWJUNDFNCm4vckZCUzliY2NJek1aMlQwNVJ2eWlPTXdRdzVMUVBQ
UWdRV29XblBsbW5SWWtUdmlldUQxTU5BbmJtRWNCb1kKU2x6NmhiaWFYRGplOFJLaXkrN0N5cHBn
U3BnN290MnlFUm9PTmZDVkpyQ3ZoMisxSk0vOXUxWHhTbmw2enhBcQpLT29ST3BHOGcvUmVkR2RB
N091bTBaSXliZzFjWkpaY0h0eXhsZTdxNkViUDJwNEJyNjZGVmVpY3J0ZVE1NG5QCkdPT2hmSXNJ
dnRpM2hyY2lmbThNV0NBeGhzc3k4OFp3S2hYV2pkUVhoNUtyYTZxMWdmVklBM1VkdW91dUpTUlQK
WGN5YUhLeElEZER2MU5ibFJXU3lNOXVoblRXeW0zdzNxd2k3WG1yeWREb3QzNHg1NHNLTVNCSDFo
b0lOa1gybgpEODlhcUdOTUNYcjJNN3BPUkpIQTZwdXFoVFZ3QklIK2RHaSswNitYSXZrWHMxS3gr
dU1COEkzTDgxY2RJeVlwCjIrWENXMlJqcjBxT0NwRktEYndLNUpwSjNQbGlvZWt4eUY4ODhEUlBz
R0k4em1VYmRFYitDeDc2VGdxcGxZQU0KTDBqL0VpbjdSQ3QyckdDc25kR0xESjMxZmd3NzhScXpB
d0FSQVFBQmlRSThCQmdCQ0FBbUZpRUV5MkxYb080NApLZVJmQUUwMG9mcEEwSmdCbk44RkFtRVNV
aGtDR3d3RkNSTE1Bd0FBQ2drUW9mcEEwSmdCbk4vcWFSQUFvbnd6Cnc4ZFN1TTBtVFNTcW9JM3FT
VWpodXBBbUVpTkpLS0J3bkJBRmJhSVpJekY0ZTlRRWpsTGFZaU8zV3loVkN3NFkKZHgwMytkYmRq
M0Q5SDQzNVJ3NHB3OHhoaHBFQ2F3YkxtdnhEZlhCVHdpR2NUQVhtQS9WMzVoa2NPcmUwdTM3aQoy
bjMvazFFaTI3UXlabkoxajZraWZEbHdTMHh2VnVIWHoyTUMrTDJscENYNnlWcGRwV3Q2Yk15TlVj
aFoyV1Z2CnRoMEUzNlN4ZUw3cDVReHlTWEZOeFd3NFJ4aGRyWHFSOGY0TVA4bEluZDVGdWJXTDV2
Tzc1Vk9kVzZXNDlxZVcKdmM1cWsrZUtvNzI0NEl6OHRaUkIvVmxnWWpIMG9JUGZEZGJMdTFoaFd0
QU12L3pkanZSSzNweGsybFI4bXhDRwpONmJaNW52ZnJOdzZYUENacWp5RHliemk4d3I4Y21PUUI5
bVU4TkZSMGl0a0Nxd3ArM0lMUXpYcnI5cE9qM0pXCkt3S0RLcSsyK0JlOEgxRW1vUXVvOWlIb0NC
NnhxQm1OTTN0M1IvMS9JUUlqQUpFZGg5NVMzeWRDYXZscW5SZUIKQ3cxNzVuSXZLcDViWUZQK1ZT
b3dpbkRoWDE0MEE3TUh0MVNndXV6ZnVoUUs0aUpKSUZ3WEp1ZG13V0NGVDVsWQpJMGtvWFJhemt6
aVAvNXlFbmxxSE02VW1ocmFmdnpXMTJzTU56SVJCVm9BNVVpN1I0YmdHREJUNlc2QWFoVUVHCk5Z
MDMxMzJwMzJUVWZ3Y3J0K2N6UEZ1TWUzQVoyWGxQTFNCNUt4SUFhbDg2WEppVHdzTjNrblh5emtk
QWtVNnoKVnFTcXA1NWtmbTQyeVRqeXJBMVFCQm91enM0NEI3TzdwdW91emxVPQo9aVlPOQotLS0t
LUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==
--------------4476A1921250A65FFAC6BC08--


