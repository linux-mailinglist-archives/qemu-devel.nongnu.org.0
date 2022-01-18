Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8385492C29
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:19:59 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9s9G-0004B3-W2
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9rYP-0002wU-OD
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9rYJ-0006qy-VA
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642524107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSSIMRvLLfSwgozJf8Fax5e4v5kFZwbWKWi1kxfT094=;
 b=bJNHBKt/5WeD1nR+7UQYh9PjuEGYfBiVWT1LS2ZEKYlLj/YbjUgl4A+dTsUOtZZKmU2q9j
 aun5EZa8JNmyg6cNZc9ud+zdf+uEAcs1NZ6L/u7wS/c0q2aRFgQEa7IsT2AzOfEJcnw8HN
 aF/RBf2gRyMXAbBFqCWjK9++d7Z7Npo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-HzG5ebbVMDC-dbe-iPSM_w-1; Tue, 18 Jan 2022 11:41:44 -0500
X-MC-Unique: HzG5ebbVMDC-dbe-iPSM_w-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so2218672wmb.7
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 08:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bSSIMRvLLfSwgozJf8Fax5e4v5kFZwbWKWi1kxfT094=;
 b=3v4TyRE0SXluU1+xqArW1jpyv68Y/ExKVSDQzW++xr4WSCv+D/Q/0FiMZ1Jam8HwfY
 4mkHqdc3ChRpOsmgs1w/2rGMNKLJQKlibARu4iShlAX13VzCZAeZ7XpuPsDbSEu3q4Cz
 956aUBdgtcDBXjSzHypApNkXnKm+xiyvFktdNjA6weQozjxLaOcYf41s6z2YSKg0aTOR
 qQTyHgLbM+4E4PZjZd2iWfmj6e+NX8CK3KH6BJldkooenHvY4ovQrAgHNLIBgSZwqaft
 j21pdQ9lvO8L/BWDpCH3pC81MVKWe+gYdCz+vMpUKlDJAVYEOLJxFmiw3fi8kqM3IbLy
 5peg==
X-Gm-Message-State: AOAM530LLDttF2buCHLzan6A4ilYhSFQ5d6SYSGXvGDVjrj7gYIZuR1k
 3meVNq6AClP8MdYlMTWUsBbmiRnJDFDZSHWZRIHWzmqZEoyhidkPRCINOr3KRtbERf4KqkjM/4o
 vhbjyEGJJO8oC/K0=
X-Received: by 2002:adf:fbcd:: with SMTP id d13mr24976000wrs.170.1642524100987; 
 Tue, 18 Jan 2022 08:41:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9SDzHqKb6wmBZA7GUn+5GKW3K/oL2N5lNLzBOjWGsFynXCNYA32QII9BT1qeQvB0cmiC5lA==
X-Received: by 2002:adf:fbcd:: with SMTP id d13mr24975967wrs.170.1642524100584; 
 Tue, 18 Jan 2022 08:41:40 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o3sm11493568wry.14.2022.01.18.08.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 08:41:40 -0800 (PST)
Message-ID: <a22b43dd-eae0-9eee-a0a2-4875c55299df@redhat.com>
Date: Tue, 18 Jan 2022 17:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] iotests/block-status-cache: New test
To: Nir Soffer <nsoffer@redhat.com>
References: <20220117162649.193501-1-hreitz@redhat.com>
 <20220117162649.193501-3-hreitz@redhat.com>
 <CAMRbyyu8onwO86m7uVEwDBPvt0hR=SEX1J2L2T9COea_tNr_CQ@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAMRbyyu8onwO86m7uVEwDBPvt0hR=SEX1J2L2T9COea_tNr_CQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.01.22 18:57, Nir Soffer wrote:
> On Mon, Jan 17, 2022 at 6:26 PM Hanna Reitz <hreitz@redhat.com> wrote:
>> Add a new test to verify that want_zero=false block-status calls do not
>> pollute the block-status cache for want_zero=true calls.
>>
>> We check want_zero=true calls and their results using `qemu-img map`
>> (over NBD), and want_zero=false calls also using `qemu-img map` over
>> NBD, but using the qemu:allocation-depth context.
>>
>> (This test case cannot be integrated into nbd-qemu-allocation, because
>> that is a qcow2 test, and this is a raw test.)
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/tests/block-status-cache   | 130 ++++++++++++++++++
>>   .../qemu-iotests/tests/block-status-cache.out |   5 +
>>   2 files changed, 135 insertions(+)
>>   create mode 100755 tests/qemu-iotests/tests/block-status-cache
>>   create mode 100644 tests/qemu-iotests/tests/block-status-cache.out
>>
>> diff --git a/tests/qemu-iotests/tests/block-status-cache b/tests/qemu-iotests/tests/block-status-cache
>> new file mode 100755
>> index 0000000000..1f2c3109d3
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/block-status-cache
>> @@ -0,0 +1,130 @@
>> +#!/usr/bin/env python3
>> +# group: rw quick
>> +#
>> +# Test cases for the block-status cache.
>> +#
>> +# Copyright (C) 2022 Red Hat, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import os
>> +import signal
>> +import iotests
>> +from iotests import qemu_img_create, qemu_img_pipe, qemu_nbd
>> +
>> +
>> +image_size = 1 * 1024 * 1024
>> +test_img = os.path.join(iotests.test_dir, 'test.img')
>> +
>> +nbd_pidfile = os.path.join(iotests.test_dir, 'nbd.pid')
>> +nbd_sock = os.path.join(iotests.sock_dir, 'nbd.sock')
>> +
>> +
>> +class TestBscWithNbd(iotests.QMPTestCase):
>> +    def setUp(self) -> None:
>> +        """Just create an empty image with a read-only NBD server on it"""
>> +        assert qemu_img_create('-f', iotests.imgfmt, test_img,
>> +                               str(image_size)) == 0
>> +
>> +        assert qemu_nbd('-k', nbd_sock, '-f', iotests.imgfmt, '-t', '-A', '-r',
>> +                        f'--pid-file={nbd_pidfile}', test_img) == 0
> This is a good place to comment that -A (or better --allocation-depth)
> is required for this test.

Sure, why not.

>> +
>> +    def tearDown(self) -> None:
>> +        with open(nbd_pidfile, encoding='utf-8') as f:
>> +            pid = int(f.read())
>> +        os.kill(pid, signal.SIGTERM)
>> +        os.remove(nbd_pidfile)
>> +        os.remove(test_img)
>> +
>> +    def test_with_zero_bug(self) -> None:
>> +        """
>> +        Verify that the block-status cache is not corrupted by a
>> +        want_zero=false call.
>> +        We can provoke a want_zero=false call with `qemu-img map` over NBD with
>> +        x-dirty-bitmap=qemu:allocation-depth, so we first run a normal `map`
> x-dirty-bitmap=qemu:allocation-depth looks a bit dirty to me but I guess
> we don't have a better way without depending on another nbd client.

Should be just fine for an iotest.  If the parameter is ever reworked, 
we can easily adjust the test.

> If depending on libnbd is ok, this test can be much simpler:
>
> $ nbdinfo --map=base:allocation nbd+unix:///?socket=/tmp/nbd.sock
>           0        4096    0  data
>        4096  1073737728    3  hole,zero
> $ nbdinfo --map=qemu:allocation-depth nbd+unix:///?socket=/tmp/nbd.sock
>           0  1073741824    1  local
> $ nbdinfo --map=qemu:allocation-depth nbd+unix:///?socket=/tmp/nbd.sock
>           0  1073741824    1  local
> $ nbdinfo --map=base:allocation nbd+unix:///?socket=/tmp/nbd.sock
>           0  1073741824    0  data
>
>> +        (which results in want_zero=true), then using said
>> +        qemu:allocation-depth context, and finally another normal `map` to
>> +        verify that the cache has not been corrupted.
>> +        """
>> +
>> +        nbd_img_opts = f'driver=nbd,server.type=unix,server.path={nbd_sock}'
>> +        nbd_img_opts_alloc_depth = nbd_img_opts + \
>> +            ',x-dirty-bitmap=qemu:allocation-depth'
>> +
>> +        # Normal map, results in want_zero=true.
>> +        # This will probably detect an allocated data sector first (qemu likes
>> +        # to allocate the first sector to facilitate alignment probing), and
>> +        # then the rest to be zero.  The BSC will thus contain (if anything)
>> +        # one range covering the first sector.
>> +        map_pre = qemu_img_pipe('map', '--output=json', '--image-opts',
>> +                                nbd_img_opts)
>> +
>> +        # qemu:allocation-depth maps for want_zero=false.
>> +        # want_zero=false should (with the file driver, which the server is
>> +        # using) report everything as data.  While this is sufficient for
>> +        # want_zero=false, this is nothing that should end up in the
>> +        # block-status cache.
>> +        # Due to a bug, this information did end up in the cache, though, and
>> +        # this would lead to wrong information being returned on subsequent
>> +        # want_zero=true calls.
>> +        #
>> +        # We need to run this map twice: On the first call, we probably still
>> +        # have the first sector in the cache, and so this will be served from
>> +        # the cache; and only the subsequent range will be queried from the
>> +        # block driver.  This subsequent range will then be entered into the
>> +        # cache.
>> +        # If we did a want_zero=true call at this point, we would thus get
>> +        # correct information: The first sector is not covered by the cache, so
>> +        # we would get fresh block-status information from the driver, which
>> +        # would return a data range, and this would then go into the cache,
>> +        # evicting the wrong range from the want_zero=false call before.
>> +        #
>> +        # Therefore, we need a second want_zero=false map to reproduce:
>> +        # Since the first sector is not in the cache, the query for its status
>> +        # will go to the driver, which will return a result that reports the
>> +        # whole image to be a single data area.  This result will then go into
>> +        # the cache, and so the cache will then report the whole image to
>> +        # contain data.
> Interesting, but once we fix the bug this complex flow is gone so
> we can eliminate this text, no?

Well...  Once the bug is fixed, we technically don’t need this test at 
all, right? O:)

This is a regression test to show that the behavior before the fix is 
broken, so it needs to reproduce the bug that existed before the fix.  
Therefore, it should include a detailed description how the reproducer 
works, i.e. in what way qemu’s behavior was broken before the fix.

(Otherwise it’d be unclear why we need to have this `range(2)` loop.)

>> +        #
>> +        # Note that once the cache reports the whole image to contain data, any
>> +        # subsequent map operation will be served from the cache, and so we can
>> +        # never loop too many times here.
>> +        for _ in range(2):
>> +            # (Ignore the result, this is just to contaminate the cache)
>> +            qemu_img_pipe('map', '--output=json', '--image-opts',
>> +                          nbd_img_opts_alloc_depth)
>> +
>> +        # Now let's see whether the cache reports everything as data, or
>> +        # whether we get correct information (i.e. the same as we got on our
>> +        # first attempt).
>> +        map_post = qemu_img_pipe('map', '--output=json', '--image-opts',
>> +                                 nbd_img_opts)
>> +
>> +        if map_pre != map_post:
>> +            print('ERROR: Map information differs before and after querying ' +
>> +                  'qemu:allocation-depth')
>> +            print('Before:')
>> +            print(map_pre)
>> +            print('After:')
>> +            print(map_post)
>> +
>> +            self.fail("Map information differs")
>> +
>> +
>> +if __name__ == '__main__':
>> +    # The block-status cache only works on the protocol layer, so to test it,
>> +    # we can only use the raw format
>> +    iotests.main(supported_fmts=['raw'],
>> +                 supported_protocols=['file'])
>> diff --git a/tests/qemu-iotests/tests/block-status-cache.out b/tests/qemu-iotests/tests/block-status-cache.out
>> new file mode 100644
>> index 0000000000..ae1213e6f8
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/block-status-cache.out
>> @@ -0,0 +1,5 @@
>> +.
>> +----------------------------------------------------------------------
>> +Ran 1 tests
>> +
>> +OK
>> --
>> 2.33.1
>>
> Reviewed-by: Nir Soffer <nsoffer@redhat.com>

Thanks, and also thanks for reporting and testing!

(I’ll send a v2 with a comment added for the qemu-nbd invocation.)

Hanna


